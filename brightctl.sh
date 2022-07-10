#!/bin/bash
step=5
case $1 in
    "up")
        brightnessctl set +$step%
        ;;
    "down")
        brightnessctl set $step%-
        ;;
    *)
        echo "Invalid option"
        ;;
esac

brightness=`brightnessctl i | awk 'FNR == 2 {gsub(/\(|%|\)/,"");print $4}'`

dunstify -r 5502222 "Brightness $brightness%" -t 2000 -i display-brightness-medium-symbolic -h int:value:$brightness
