#!/usr/bin/env bash

# common functions
source ~/.local/scripts/common.sh

# do not run in wsl (no update + cpu usage issues)
if [ "$(is_wsl)" == "true" ]; then
  ~/.local/bin/wallpaper restore
  exit 0
fi

# check if swww is present
if ! command -v swww &> /dev/null
then
    exit 1
fi

# start swww daemon if not running
swww query >/dev/null 2>&1
if [ $? -eq 1 ]; then
  swww init
fi

# set wallpaper (restore last wallpaper or default to first wallpaper)
sleep 0.5
~/.local/bin/wallpaper restore
