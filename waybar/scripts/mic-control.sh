#!/bin/bash

# Notification ID
ID=2003

case "$1" in
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        ;;
esac

# Get current mic mute status
mic_info=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)
mute=$(echo "$mic_info" | grep "MUTED")

if [ -n "$mute" ]; then
    dunstify -a "Microphone" -r "$ID" -u low \
        -h string:x-dunst-stack-tag:microphone \
        "󰍭  Microphone Muted"
else
    dunstify -a "Microphone" -r "$ID" -u low \
        -h string:x-dunst-stack-tag:microphone \
        "󰍬  Microphone Active"
fi
