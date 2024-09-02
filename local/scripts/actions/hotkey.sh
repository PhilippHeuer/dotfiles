#!/usr/bin/env bash

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

# fallback to home directory, if cwd is not a valid directory
if [ ! -d "$cwd" ]; then
  cwd=${HOME}
fi
cd "$cwd"

# configuration
terminal="$HOME/.local/scripts/actions/terminal.sh"
menu="$HOME/.local/scripts/launcher.sh rofi"
browser="MOZ_ENABLE_WAYLAND=1 firefox -new-window"

# handle keypress
KEY=$1
echo "HOTKEY: [$KEY]"
case $KEY in
    # reload
    "mod+shift+r")
        ~/.local/scripts/waybar/waybar.sh
        ;;
    # app launchers
    "mod+space")
        $menu
        ;;
    "mod+m")
        $menu
        ;;
    "f1")
        $terminal --title fzf_popup tmx project
        ;;
    "f2")
        $terminal --title fzf_popup tmx ssh
        ;;
    "f3")
        $terminal --title fzf_popup tmx kubernetes
        ;;
    "f4")
        $terminal --title fzf_popup tmx menu
        ;;
    "f12")
        $terminal --title fzf_popup gocheat
        ;;
    "mod+return")
        $terminal
        ;;
    "mod+g")
        $terminal --title "lazygit" lazygit
        ;;
    "mod+w")
        $browser
        ;;
    "mod+l")
        ~/.config/wlogout/scripts/lock.sh
        ;;
    "ctrl+mod+l")
        ~/.config/hypr/scripts/logout.sh
        ;;
    *)
        ;;
esac
