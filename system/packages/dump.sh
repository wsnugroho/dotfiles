#!/bin/bash
set -euo pipefail

# Refresh package lists from the live system without replacing them on failure.
cd "$(dirname "$0")"

native_tmp=$(mktemp .pacman.txt.XXXXXX)
aur_tmp=$(mktemp .aur.txt.XXXXXX)
trap 'rm -f "$native_tmp" "$aur_tmp"' EXIT

pacman -Qqen | sort -u > "$native_tmp"
pacman -Qqem | sort -u > "$aur_tmp"

mv "$native_tmp" pacman.txt
mv "$aur_tmp" aur.txt
