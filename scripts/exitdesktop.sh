#!/usr/bin/env bash

###
# terminates the window manager
###

# common functions
source ~/.local/scripts/common.sh

# Detect and terminate window manager
WM=$(detect_wm)
case "$WM" in
    sway)
        echo "Exiting sway ..."
        swaymsg exit
        ;;
    hyprland)
        echo "Exiting hyprland ..."
        hyprctl dispatch exit 0
        ;;
    *)
        echo "Error: window manager ($WM) not supported. Exiting."
        exit 1
        ;;
esac

exit 0
