#!/usr/bin/env bash

###
# script to display the power menu
#
# supported window managers:
# - sway
# - hyprland
#
# special cases:
# - on wsl this clsoes the current session directly
###

PIDFILE="/tmp/waybar.pid"

# common functions
source ~/.local/scripts/common.sh

# check if waybar is running
if [ -e "$PIDFILE" ] && ps -p $(cat "$PIDFILE") &> /dev/null; then
    echo "Waybar is already running. Killing the existing process."
    kill -9 "$(cat "$PIDFILE")"
fi

# start waybar based on window manager and wsl status
WM=$(detect_wm)
WSL=$(is_wsl)
CASE="$WM$([ "$WSL" = true ] && echo "-wsl")"
echo "Starting waybar for $CASE"
case "$CASE" in
    sway)
        waybar -c ~/.config/waybar/sway/config.jsonc -s ~/.config/waybar/sway/style.css &
        ;;
    sway-wsl)
        waybar -c ~/.config/waybar/sway/config-wsl.jsonc -s ~/.config/waybar/sway/style.css &
        ;;
    hyprland)
        waybar -c ~/.config/waybar/hyprland/config.jsonc -s ~/.config/waybar/hyprland/style.css &
        ;;
    hyprland-wsl)
        waybar -c ~/.config/waybar/hyprland/config-wsl.jsonc -s ~/.config/waybar/hyprland/style.css &
        ;;
    *)
        echo "Error: waybar for window manager ($WM) not supported. Exiting."
        exit 1
        ;;
esac
echo $! > "$PIDFILE"
