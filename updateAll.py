#!/usr/bin/python
import os
print('\nsudo pacman -Syu')
os.system('sudo pacman -Syu')
print('\nflatpak update')
os.system('flatpak update')
print('\n~/git/scripts/updateRust.py')
os.system('~/git/scripts/updateRust.py')
print('\n~/git/vvsaur/vvsaur.py u')
os.system('~/git/vvsaur/vvsaur.py u')
