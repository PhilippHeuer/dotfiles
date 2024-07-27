#!/usr/bin/env bash

# See https://wiki.hyprland.org/Configuring/Monitors/
# This script is used to configure monitors for different machines

hostname=$(hostname)
if [ "$hostname" == "phx-desktop" ]; then
  hyprctl keyword monitor HDMI-A-1,1920x1080@60,0x0,1
  hyprctl keyword monitor DP-3,3440x1440@99.98,1920x0,1
fi
