#!/usr/bin/env bash

###
# Global variables
#
# contains host-specific variables that can not be detected automatically, can be removed once wlr-randr works on wsl
###
export HOSTNAME_HASH=$(printf "DF/$HOSTNAME" | sha256sum  | cut -c1-64)
if [ "$HOSTNAME_HASH" = "45d416256eed31b1e8d6221348dbd5d43f0ebcef4a7fa6848af6961c20de991c" ]; then
    export RESOLUTION_WIDTH=3440
    export RESOLUTION_HEIGHT=1440
else
    export RESOLUTION_WIDTH=1920
    export RESOLUTION_HEIGHT=1080
fi

###
# Checks whether the script is running in a Windows Subsystem for Linux (WSL) environment.
#
# Returns:
#   - "true" if in WSL
#   - "false" if not in WSL
###
function is_wsl() {
    if [[ $(uname -srm) == *microsoft-standard-WSL2* ]]; then
        echo "true"
    else
        echo "false"
    fi
}

###
# Checks which window manager is running.
#
# supported window managers:
# - sway
# - hyprland
###
function detect_wm() {
    if [[ "$DESKTOP_SESSION" == "hyprland" ]]; then
        echo "hyprland"
    elif [[ -n "$SWAYSOCK" ]]; then
        echo "sway"
    else
        echo "unknown"
    fi
}
