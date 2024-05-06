#!/usr/bin/env bash

# common functions
source ~/.local/scripts/common.sh

WM=$(detect_wm)
case "$WM" in
    i3)
        pid=$(xdotool getwindowfocus getwindowpid)
        cwd=$(readlink -e "/proc/$pid/cwd")
        ;;
    sway)
        pid=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .pid')
        cwd=$(readlink -e "/proc/$pid/cwd")
        ;;
    hyprland)
        cwd=$(pwd) # TODO: implement
        ;;
    *)
        echo "Error: window manager ($WM) not supported. Exiting."
        exit 1
        ;;
esac

echo "Staring Launcher from PID ($pid) / CWD ($cwd)"

if [ "$1" = "rofi" ]; then
    rofi -show
elif [ "$1" = "albert" ]; then
    # ensure albert is running
    if ! pgrep -x "albert" > /dev/null; then
        # start Albert
        nohup albert > /dev/null 2>&1 &

        # wait for albert to start
        sleep 1
    fi

    # show launcher
    albert toggle
else
    echo "Error: invalid argument ($1). Exiting."
    exit 1
fi
