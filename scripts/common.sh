#!/usr/bin/env bash

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
