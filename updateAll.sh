#!/usr/bin/bash
# set -x

printf 'updating arch\n + sudo pacman -Syu \n'
sudo pacman -Syu

printf '\n + flatpak update \n'
flatpak update

#printf '\n + Updating rust \n'
#~/git/scripts/updateRust.py

printf '\n + Updating AUR \n'
/home/samot/hd/samot/git/vvsaur/vvsaur.py u

out=$(pacman -Qtd)
if [ ${#out} -gt 0 ];then
    printf '\nDependencies that are installed but are not needed: \n'
    echo "$out"
    printf "\n"
    read     -n1 -p 'Uninstall them? [y/N]: ' input
    case $input in
        y|Y|yes|Yes|YES)
            line=$(echo "$out" | awk -F" " '{print $1}' | awk 'BEGIN { ORS=" "} {print}')
            printf '\n'
            sudo pacman -Rns $line
            ;;
        *) printf '\n';;
    esac
fi

case "$(date +%w)" in 
  6|0)
    printf '\nWeekend, cleaning package cache\n + sudo paccache -r\n'
    sudo paccache -r
    ;;
esac

