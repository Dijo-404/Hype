#!/bin/bash

# Notification ID
ID=2001

case "$1" in
    up)
        brightnessctl set 5%+
        ;;
    down)
        brightnessctl set 5%-
        ;;
esac

# Get current brightness percentage
current=$(brightnessctl get)
max=$(brightnessctl max)
percent=$(echo "scale=0; $current * 100 / $max" | bc)

# Select icon
if [ "$percent" -lt 30 ]; then
    icon="󰃞"
elif [ "$percent" -lt 70 ]; then
    icon="󰃟"
else
    icon="󰃠"
fi

# Send notification
dunstify -a "Brightness" -r "$ID" -u low \
    -h int:value:"$percent" \
    -h string:x-dunst-stack-tag:brightness \
    "$icon Brightness: ${percent}%"
