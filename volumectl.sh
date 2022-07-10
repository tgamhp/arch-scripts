#!/bin/bash

step=5

detectMute=`pactl list sinks | grep "Mute" | awk 'FNR == 1 {print $2}'`

case $1 in
    "down")
        if [ $detectMute == "no" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ -$step%
        fi
        ;;
    "up")
        if [ $detectMute == "no" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ +$step%
        fi
        ;;
    "toggle")
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    *)
        echo "Invalid option"
        ;;
esac

muted=`pactl list sinks | grep "Mute" | awk 'FNR == 1 {print $2}'`
volume=`pactl list sinks | grep "Volume:" | awk 'FNR == 1 {gsub(/%/,"");print $5}'`

if [ $muted == "yes" ]; then
    dunstify -r 5501232 "Muted" -t 2000 -i audio-volume-muted
else
    dunstify -r 5501232 "Volume  $volume%" -t 2000 -i audio-volume-high -h int:value:$volume
fi
