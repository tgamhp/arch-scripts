#!/bin/sh
choice=$(echo -e ' Suspend\n lock screen\n logout\n Shutdown\n reboot' | dmenu -p "Power" -bw 4 -l 10 -sb "#007acc" -fn 'Noto Sans:regular:pixelsize=15' -h 30)

case $choice in
    " Shutdown")
        systemctl poweroff;;
    " reboot")
        systemctl reboot;;
    " logout")
        killall qtile;;
    " Suspend")
        dm-tool switch-to-greeter && systemctl suspend;;
    " lock screen")
        dm-tool switch-to-greeter;;
    *)
        echo "invalid choice";;
esac
