#!/bin/bash
directories=$(cat ~/.scripts/config-files | tr '\n' ' ' |sed -e 's. .|.g'|sed -e 's.|$..g')

option=$(find ~/.config -type f | grep -Ei "$directories" | sed -e 's-/home/ahmed/.config/--g' | dmenu -p "Power" -bw 4 -l 10 -sb "#007acc" -fn 'Noto Sans:regular:pixelsize=15' -h 30)

if [ -n "$option" ];then
    alacritty -e xed /home/ahmed/.config/$option
fi

