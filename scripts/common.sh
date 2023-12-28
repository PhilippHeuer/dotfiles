#!/usr/bin/env bash

###
# Global variables
#
# contains host-specific variables that can not be detected automatically, can be removed once wlr-randr works on wsl
###
export MACHINE_ID=$(cat /etc/machine-id)
if [ "$MACHINE_ID" = "983954ad97e846b3979d67824db9b64f" ] || [ "$MACHINE_ID" = "a2c89aee527d4f1eb3b3e43003815f9a" ]; then
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
