#!/usr/bin/env bash

# ensure tmux server is running
tmux start-server

# tmux history per window
if [[ $TMUX_PANE ]]; then
  sessionName=$(tmux display-message -p "#S")
  windowName=$(tmux display-message -p "#W")

  mkdir -p "$HOME/tmux/history/"
  export HISTFILE="$HOME/tmux/history/.bash_history_${sessionName}_${windowName}"
fi
