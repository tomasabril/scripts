#!/usr/bin/bash
# set -x

if ! ping -c 1 archlinux.org &> /dev/null; then
    echo "No internet? Stopping update"
    exit 1
fi


printf '$XDG_SESSION_TYPE: '
echo $XDG_SESSION_TYPE
printf '\n'

./archnews.py
printf '\n'

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
    printf '\nWeekend - cleaning package cache, flatpak old files, old systemctl log files\n\n'
    printf 'paccache'
    sudo paccache -r
    printf '\nflatpak\n'
    flatpak uninstall --unused
    printf '\nlogs\n'
    sudo journalctl --vacuum-time=14d
    printf '\nRun sudo pacdiff to review .pacnew files\n'
    ;;
esac

