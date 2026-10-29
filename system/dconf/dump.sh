#!/bin/bash
# Refresh dconf/gnome.ini from the live system, keeping only portable sections.
# Run after changing GNOME settings, then commit.
set -euo pipefail

cd "$(dirname "$0")"
tmp=$(mktemp .gnome.ini.XXXXXX)
trap 'rm -f "$tmp"' EXIT

dconf dump /org/gnome/ | awk '
  /^\[/ { keep = ($0 ~ /^\[(desktop\/(interface|input-sources|peripherals|wm|app-folders|datetime|privacy|calendar|sound)|mutter|shell|settings-daemon\/plugins\/(media-keys|power|color)|nautilus\/preferences|tweaks)/) }
  keep
' > "$tmp"

mv "$tmp" gnome.ini
