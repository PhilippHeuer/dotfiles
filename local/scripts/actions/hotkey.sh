#!/usr/bin/env bash

# configuration
terminal="kitty"
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
