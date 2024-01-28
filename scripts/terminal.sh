#!/usr/bin/env bash

###
# script to start a window manager from the terminal / in WSL
###

# common functions
source ~/.local/scripts/common.sh

# detect current working directory
cwd=${HOME}
WM=$(detect_wm)
if [ "$WM" = "sway" ]; then
  pid=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .pid')
  cwd=$(readlink -e "/proc/$pid/cwd")
fi

# get first arg or default to bash
executable=${1:-"bash"}

# start terminal
cd "$cwd"
if command -v kitty &> /dev/null; then
  exec kitty --working-directory "$cwd" $executable
elif command -v alacritty &> /dev/null; then
  exec alacritty --working-directory "$cwd" -e $executable
fi
