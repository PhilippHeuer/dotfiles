#!/usr/bin/env bash

###
# terminates the window manager
###

# common functions
source ~/.local/scripts/common.sh

# terminate all ui-related processes
function terminateUI() {
    killall -9 xdg-desktop-portal-hyprland > /dev/null 2>&1
    killall -9 xdg-desktop-portal-gnome > /dev/null 2>&1
    killall -9 xdg-desktop-portal-kde > /dev/null 2>&1
    killall -9 xdg-desktop-portal-lxqt > /dev/null 2>&1
    killall -9 xdg-desktop-portal-wlr > /dev/null 2>&1
    killall -9 xdg-desktop-portal > /dev/null 2>&1
    killall -9 xdg-document-portal > /dev/null 2>&1
    killall -9 xdg-permission-store > /dev/null 2>&1
    killall -9 waybar > /dev/null 2>&1
    killall -9 albert > /dev/null 2>&1
}

# Detect and terminate window manager
WM=$(detect_wm)
case "$WM" in
    sway)
        echo "Exiting sway ..."
        swaymsg exit
        terminateUI
        ;;
    hyprland)
        echo "Exiting hyprland ..."
        hyprctl dispatch exit 0
        terminateUI
        ;;
    *)
        echo "Error: window manager ($WM) not supported. Exiting."
        exit 1
        ;;
esac

exit 0
