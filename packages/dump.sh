#!/bin/bash
# Refresh package lists from the live system, then commit.
cd "$(dirname "$0")"
pacman -Qqen > pacman.txt
pacman -Qqem > aur.txt
