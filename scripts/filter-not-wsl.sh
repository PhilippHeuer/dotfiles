#!/usr/bin/env bash

###
# a script that fails when running in wsl, can be used with && when running a wm start script

# common functions
source ~/.local/scripts/common.sh

# do not run in wsl (no update + cpu usage issues)
if [ "$(is_wsl)" == "true" ]; then
  exit 1
fi

exit 0
