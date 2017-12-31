#!/usr/bin/bash
set -x
sudo pacman -Syu
echo ''
flatpak update
echo ''
~/git/scripts/updateRust.py
echo ''
~/git/vvsaur/vvsaur.py u
