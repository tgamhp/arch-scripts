#!/bin/bash
option=$(ls -1NA /usr/share/man/man1/ | sed -e 's/.gz//g' | dmenu -p " Man " -bw 4 -l 10 -sb "#007acc" -fn 'Noto Sans:regular:pixelsize=15' -h 30)

if [ -n "$option" ];then
#PAGER='less --color=dr --color=uy --mouse --wheel-lines=2' 
PAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"' alacritty -t "man $option" -e man $option
fi
