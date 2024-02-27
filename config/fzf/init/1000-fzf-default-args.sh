#!/usr/bin/env bash

mkdir -p ~/.local/share/fzf

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --history=$HOME/.local/share/fzf/history \
  --history-size=10000"
