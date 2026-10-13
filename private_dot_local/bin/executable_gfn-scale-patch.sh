#!/usr/bin/env bash
set -Eeuo pipefail

APP_ID="com.nvidia.geforcenow"
APP_HOME="$HOME/.var/app/$APP_ID"

die() {
    echo
    echo "ERROR: $*" >&2
    echo
    exit 1
}

print_startup_warning() {
    echo
    echo "================================================================"
    echo " IMPORTANT"
    echo "================================================================"
    echo " GeForce NOW must be launched at least once before this script"
    echo " can apply the scaling patch."
    echo
    echo " The first launch creates the user profile and the Preferences"
    echo " file required by this script."
    echo
    echo " If you have never launched GeForce NOW:"
    echo
    echo "   1. Start GeForce NOW normally."
    echo "   2. Wait until the main application window appears."
    echo "   3. Close GeForce NOW completely."
    echo "   4. Run this script again."
    echo
    echo " Do not run this script with sudo."
    echo "================================================================"
    echo
}

find_preferences() {
    local default_path

    default_path="$APP_HOME/.local/state/NVIDIA/GeForceNOW/CefCache/Default/Preferences"

    if [[ -f "$default_path" ]]; then
        printf '%s\n' "$default_path"
        return 0
    fi

    find "$APP_HOME" \
        -type f \
        -path '*/CefCache/Default/Preferences' \
        -print \
        -quit 2>/dev/null
}

stop_gfn() {
    flatpak kill "$APP_ID" >/dev/null 2>&1 || true
}

launch_gfn() {
    local answer

    echo
    read -r -p "Launch GeForce NOW now? [Y/n]: " answer

    case "${answer,,}" in
        n|no)
            echo "GeForce NOW was not launched."
            ;;
        *)
            echo "Launching GeForce NOW..."
            flatpak run "$APP_ID" >/dev/null 2>&1 &
            disown
            ;;
    esac
}

apply_scale() {
    local scale="$1"

    stop_gfn

    PREFS="$PREFS" SCALE="$scale" python3 <<'PY'
import json
import math
import os
import shutil
import stat
from pathlib import Path

prefs = Path(os.environ["PREFS"])
scale_text = os.environ["SCALE"].strip().replace(",", ".")

try:
    scale = float(scale_text)
except ValueError:
    raise SystemExit(f"Invalid scale value: {scale_text}")

if not math.isfinite(scale):
    raise SystemExit("Scale must be a finite number.")

if scale < 0.50 or scale > 4.00:
    raise SystemExit("Scale must be between 0.50 and 4.00.")

try:
    original_text = prefs.read_text(encoding="utf-8")
    data = json.loads(original_text)
except FileNotFoundError:
    raise SystemExit(f"Preferences file not found: {prefs}")
except json.JSONDecodeError as exc:
    raise SystemExit(f"Cannot parse Preferences file: {exc}")

if not isinstance(data, dict):
    raise SystemExit("Unexpected Preferences file format.")

backup = prefs.with_name(prefs.name + ".gfn-scale-backup")

if not backup.exists():
    shutil.copy2(prefs, backup)

partition = data.get("partition")

if not isinstance(partition, dict):
    partition = {}
    data["partition"] = partition

zoom_level = math.log(scale) / math.log(1.2)

partition["default_zoom_level"] = {
    "x": zoom_level
}

temporary = prefs.with_name(prefs.name + ".gfn-scale-tmp")

temporary.write_text(
    json.dumps(
        data,
        ensure_ascii=False,
        separators=(",", ":")
    ),
    encoding="utf-8"
)

temporary.chmod(stat.S_IMODE(prefs.stat().st_mode))
temporary.replace(prefs)

print()
print("Scaling patch applied successfully.")
print(f"Selected scale: {scale:.2f}x ({scale * 100:.0f}%)")
print(f"CEF zoom level: {zoom_level:.6f}")
print(f"Preferences file: {prefs}")
print(f"Original backup: {backup}")
PY

    launch_gfn
}

restore_default() {
    stop_gfn

    PREFS="$PREFS" python3 <<'PY'
import json
import os
import shutil
import stat
from pathlib import Path

prefs = Path(os.environ["PREFS"])

try:
    data = json.loads(prefs.read_text(encoding="utf-8"))
except FileNotFoundError:
    raise SystemExit(f"Preferences file not found: {prefs}")
except json.JSONDecodeError as exc:
    raise SystemExit(f"Cannot parse Preferences file: {exc}")

if not isinstance(data, dict):
    raise SystemExit("Unexpected Preferences file format.")

backup = prefs.with_name(prefs.name + ".gfn-scale-backup")

if not backup.exists():
    shutil.copy2(prefs, backup)

removed = False
partition = data.get("partition")

if isinstance(partition, dict):
    removed = partition.pop("default_zoom_level", None) is not None

temporary = prefs.with_name(prefs.name + ".gfn-scale-tmp")

temporary.write_text(
    json.dumps(
        data,
        ensure_ascii=False,
        separators=(",", ":")
    ),
    encoding="utf-8"
)

temporary.chmod(stat.S_IMODE(prefs.stat().st_mode))
temporary.replace(prefs)

print()

if removed:
    print("The scaling patch has been removed successfully.")
else:
    print("No scaling patch was present.")

print("GeForce NOW will use its default application scaling.")
PY

    launch_gfn
}

restore_original_backup() {
    local backup

    backup="${PREFS}.gfn-scale-backup"

    if [[ ! -f "$backup" ]]; then
        echo
        echo "No original backup file was found:"
        echo "$backup"
        return
    fi

    stop_gfn

    cp --preserve=mode,timestamps "$backup" "$PREFS"

    echo
    echo "The original Preferences backup has been restored."
    echo "Restored from:"
    echo "$backup"

    launch_gfn
}

show_current_scale() {
    PREFS="$PREFS" python3 <<'PY'
import json
import math
import os
from pathlib import Path

prefs = Path(os.environ["PREFS"])

try:
    data = json.loads(prefs.read_text(encoding="utf-8"))
except FileNotFoundError:
    raise SystemExit(f"Preferences file not found: {prefs}")
except json.JSONDecodeError as exc:
    raise SystemExit(f"Cannot parse Preferences file: {exc}")

zoom = None

if isinstance(data, dict):
    partition = data.get("partition", {})

    if isinstance(partition, dict):
        default_zoom = partition.get("default_zoom_level", {})

        if isinstance(default_zoom, dict):
            zoom = default_zoom.get("x")

print()

if zoom is None:
    print("Current scaling: default application scaling")
else:
    try:
        zoom = float(zoom)
        scale = math.pow(1.2, zoom)

        print(f"Current patched scaling: {scale:.2f}x ({scale * 100:.0f}%)")
        print(f"CEF zoom level: {zoom:.6f}")
    except (TypeError, ValueError, OverflowError):
        print(f"Current CEF zoom setting could not be interpreted: {zoom!r}")
PY
}

show_recommendations() {
    echo
    echo "Suggested starting points:"
    echo
    echo "  1.25x - 1440p displays or large 4K monitors"
    echo "  1.50x - recommended for 4K with 125% desktop scaling"
    echo "  1.75x - 4K laptops or smaller high-DPI monitors"
    echo "  2.00x - very small GUI on high-DPI displays"
    echo
    echo "These are only starting points. The best value depends on"
    echo "screen size, viewing distance and desktop scaling."
}

command -v flatpak >/dev/null 2>&1 ||
    die "Flatpak is not installed."

command -v python3 >/dev/null 2>&1 ||
    die "Python 3 is not installed."

if [[ "${EUID}" -eq 0 ]]; then
    die "Do not run this script as root or with sudo. Run it as your regular desktop user."
fi

flatpak info "$APP_ID" >/dev/null 2>&1 ||
    die "GeForce NOW Flatpak is not installed: $APP_ID"

print_startup_warning

if [[ ! -d "$APP_HOME" ]]; then
    die "The GeForce NOW user profile was not found.

Launch GeForce NOW once as your regular user, wait for the main window,
close it completely, and then run this script again."
fi

PREFS="$(find_preferences || true)"

if [[ -z "$PREFS" || ! -f "$PREFS" ]]; then
    die "The GeForce NOW Preferences file was not found.

Launch GeForce NOW once as your regular user, wait for the main window,
close it completely, and then run this script again."
fi

while true; do
    echo
    echo "================================================================"
    echo " GeForce NOW Scaling Patch"
    echo "================================================================"
    echo
    echo " Preferences file:"
    echo " $PREFS"
    echo
    echo " Scaling options:"
    echo
    echo "  1) 1.25x / 125% - 1440p or large 4K monitor"
    echo "  2) 1.50x / 150% - recommended for 4K at desktop 125%"
    echo "  3) 1.75x / 175% - smaller 4K or high-DPI display"
    echo "  4) 2.00x / 200% - very high DPI or extremely small GUI"
    echo "  5) Custom scaling value"
    echo
    echo " Maintenance:"
    echo
    echo "  6) Default scaling - remove the patch"
    echo "  7) Restore the original Preferences backup"
    echo "  8) Show current scaling"
    echo "  9) Show scaling recommendations"
    echo
    echo "  0) Exit"
    echo

    read -r -p "Select an option: " choice

    case "$choice" in
        1)
            apply_scale "1.25"
            ;;
        2)
            apply_scale "1.50"
            ;;
        3)
            apply_scale "1.75"
            ;;
        4)
            apply_scale "2.00"
            ;;
        5)
            echo
            read -r -p "Enter a custom scale, for example 1.30 or 1.60: " custom_scale
            apply_scale "$custom_scale"
            ;;
        6)
            restore_default
            ;;
        7)
            restore_original_backup
            ;;
        8)
            show_current_scale
            ;;
        9)
            show_recommendations
            ;;
        0)
            echo
            echo "Exiting."
            exit 0
            ;;
        *)
            echo
            echo "Invalid option. Select a number from 0 to 9."
            ;;
    esac
done

