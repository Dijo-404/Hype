#!/bin/bash

# Notification ID
ID=2001

case "$1" in
    up)
        brightnessctl set 1%+
        ;;
    down)
        brightnessctl set 1%-
        ;;
esac

# Get current brightness percentage
current=$(brightnessctl get)
max=$(brightnessctl max)
percent=$((current * 100 / max))

# Select icon
if [ "$percent" -lt 30 ]; then
    icon="󰃞"
elif [ "$percent" -lt 70 ]; then
    icon="󰃟"
else
    icon="󰃠"
fi

# Send notification with progress bar (same style as volume)
dunstify -a "Brightness" -r "$ID" -u low \
    -h int:value:"$percent" \
    -h string:x-dunst-stack-tag:brightness \
    "$icon Brightness: ${percent}%"
