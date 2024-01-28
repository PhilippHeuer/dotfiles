#!/usr/bin/env bash

# common functions
source ~/.local/scripts/common.sh

# detect wm
case "$(detect_wm)" in
  sway)
    # sway reload also reloads waybar
    swaymsg reload
    ;;
  hyprland)
    # hyprland reloads by itself, so we only need to reload waybar
    ~/.local/scripts/waybar.sh
    ;;
  *)
    ;;
esac

# bash
if [ -f ~/.config/bash/init.sh ]; then
    source ~/.config/bash/init.sh
fi
