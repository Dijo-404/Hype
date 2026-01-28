#!/bin/bash

STATE_FILE="/tmp/caffeine_state"
ID=2002

if [ "$1" == "toggle" ]; then
    if [ -f "$STATE_FILE" ]; then
        rm "$STATE_FILE"
        dunstify -a "System" -r "$ID" -u normal "󰾪 Caffeine Mode Deactive" "System will auto-suspend"
        # For waybar module
        echo '{"text": "󰾪", "tooltip": "Caffeine: Off", "class": "deactivated"}'
    else
        touch "$STATE_FILE"
        dunstify -a "System" -r "$ID" -u normal "󰅶 Caffeine Mode Active" "System will stay awake"
        # For waybar module
        echo '{"text": "󰅶", "tooltip": "Caffeine: On", "class": "activated"}'
    fi
    # Send signal to waybar to update module immediately (optional, if we use signal)
    pkill -RTMIN+15 waybar
else
    # Status check for Waybar interval
    if [ -f "$STATE_FILE" ]; then
         echo '{"text": "󰅶", "tooltip": "Caffeine: On", "class": "activated"}'
    else
         echo '{"text": "󰾪", "tooltip": "Caffeine: Off", "class": "deactivated"}'
    fi
fi
