#!/usr/bin/env bash

###
# script to display the power menu
#
# supported window managers:
# - sway
# - hyprland
###
PIDFILE="/tmp/waybar.pid"

# common functions
source ~/.local/scripts/common.sh

# function to start waybar
start_waybar() {
    WM=$(detect_wm)
    WSL=$(is_wsl)
    CASE="$WM$([ "$WSL" = true ] && echo "-wsl")"
    echo "Starting waybar for $CASE"
    case "$CASE" in
        sway)
            waybar -c ~/.config/waybar/layouts/default.jsonc -s ~/.config/waybar/layouts/default.css &
            ;;
        sway-wsl)
            waybar -c ~/.config/waybar/layouts/default.jsonc -s ~/.config/waybar/layouts/default.css &
            ;;
        hyprland)
            waybar -c ~/.config/waybar/layouts/default.jsonc -s ~/.config/waybar/layouts/default.css &
            ;;
    esac
    echo $! > "$PIDFILE"
}

# check if waybar is running
if [ -e "$PIDFILE" ] && ps -p $(cat "$PIDFILE") &> /dev/null; then
    echo "Waybar is already running. Killing the existing process."
    kill -9 "$(cat "$PIDFILE")"
fi

# start waybar initially
start_waybar

# check for loop argument
if [ "$1" = "loop" ]; then
    while true; do
        sleep 5

        # cancel, if no window manager is running
        if ! pgrep sway > /dev/null && ! pgrep hyprland > /dev/null; then
          break
        fi

        # start waybar if it has crashed
        if ! ps -p $(cat "$PIDFILE") &> /dev/null; then
          echo "Waybar has crashed. Restarting..."
          start_waybar
        fi
    done
fi
