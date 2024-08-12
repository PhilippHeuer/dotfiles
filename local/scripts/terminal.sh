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
if [ "$WM" = "i3" ]; then
  pid=$(i3-msg -t get_tree | jq '.. | select(.focused==true) | .pid')
  cwd=$(readlink -e "/proc/$pid/cwd")
fi
if [ "$WM" = "hyprland" ]; then
  pid=$(hyprctl activewindow | awk '/pid:/ {print $2}')
  cwd=$(readlink -e "/proc/$pid/cwd")
fi

# arguments
title=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --title)
      title="$2"
      shift 2
      ;;
    *)
      break
      ;;
  esac
done
executable=${1:-"bash"}

# start terminal
cd "$cwd"
if command -v foot &> /dev/null; then
  exec foot --title "${title:-foot}" --working-directory "$cwd" $@
elif command -v kitty &> /dev/null; then
  exec kitty --title "${title:-kitty}" --working-directory "$cwd" $@
elif command -v alacritty &> /dev/null; then
  exec alacritty --title "${title:-alacritty}" --working-directory "$cwd" -e $@
else
  echo "No terminal emulator found"
  exit 1
fi
