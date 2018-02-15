#!/usr/bin/bash
# set -x
printf 'updating arch\n + sudo pacman -Syu \n'
sudo pacman -Syu
printf '\n + flatpak update \n'
flatpak update
printf '\n + Updating rust \n'
~/git/scripts/updateRust.py
printf ' + Updating AUR \n'
~/git/vvsaur/vvsaur.py u
printf '\nDependencies that are installed but are not needed: \n'
pacman -Qtd
