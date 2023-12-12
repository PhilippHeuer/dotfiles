#!/usr/bin/env bash

# start swww daemon if not running
swww query
if [ $? -eq 1 ] ; then
    swww init
fi

# set wallpaper (restore last wallpaper or default to first wallpaper)
sleep 0.1
~/.config/hypr/scripts/wallpaper restore
