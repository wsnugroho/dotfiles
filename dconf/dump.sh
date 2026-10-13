#!/bin/bash
# Refresh dconf/gnome.ini from the live system, keeping only portable sections.
# Run after changing GNOME settings, then commit.
cd "$(dirname "$0")"
dconf dump /org/gnome/ | awk '
  /^\[/ { keep = ($0 ~ /^\[(desktop\/(interface|input-sources|peripherals|wm|app-folders|datetime|privacy|calendar|sound)|mutter|shell|settings-daemon\/plugins\/(media-keys|power|color)|nautilus\/preferences|tweaks)/) }
  keep
' > gnome.ini
