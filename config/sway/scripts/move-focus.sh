#!/usr/bin/env bash

###
# This script is used to move focus to the next window in the given direction.
# It allows to cycle through windows even if they are in fullscreen.
#

# is the current window fullscreen?
is_fullscreen() {
  local fullscreen
  fullscreen=$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | select(.focused) | .fullscreen_mode')
  test "$fullscreen" = "1"
}

# Move your focus around
if is_fullscreen; then
  swaymsg fullscreen toggle # exit fullscreen
  swaymsg focus $1 # move focus
  swaymsg fullscreen toggle # re-enter fullscreen
else
  swaymsg focus $1 # move focus
fi
