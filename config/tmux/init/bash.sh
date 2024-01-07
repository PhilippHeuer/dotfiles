#!/usr/bin/env bash

# tmux history per window
if [[ -n "$TMUX_PANE" ]]; then
  sessionName=$(tmux display-message -p "#S")
  windowName=$(tmux display-message -p "#W")

  mkdir -p "$HOME/tmux/history/"
  export HISTFILE="$HOME/tmux/history/.bash_history_${sessionName}_${windowName}"
fi
