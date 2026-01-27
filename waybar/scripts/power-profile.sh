#!/bin/bash

# Power Profile Menu Script for Waybar
# Uses rofi for dropdown selection

get_current_profile() {
    powerprofilesctl get
}

get_icon() {
    case $1 in
        "performance") echo "󰓅" ;;
        "balanced") echo "󰾅" ;;
        "power-saver") echo "󰾆" ;;
        *) echo "󰾅" ;;
    esac
}

if [[ "$1" == "menu" ]]; then
    # Show rofi menu
    options="󰓅 Performance\n󰾅 Balanced\n󰾆 Power Saver"
    choice=$(echo -e "$options" | rofi -dmenu -p "Power Profile" -i)
    
    case "$choice" in
        *"Performance"*) powerprofilesctl set performance ;;
        *"Balanced"*) powerprofilesctl set balanced ;;
        *"Power Saver"*) powerprofilesctl set power-saver ;;
    esac
else
    # Output for waybar
    current=$(get_current_profile)
    icon=$(get_icon "$current")
    
    # JSON output for waybar custom module
    echo "{\"text\": \"$icon\", \"tooltip\": \"Power Profile: $current\", \"class\": \"$current\"}"
fi
