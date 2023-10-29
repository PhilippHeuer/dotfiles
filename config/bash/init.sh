#!/usr/bin/env bash

# defaults
export TERM=xterm-256color
export GPG_TTY=$(tty)

# path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts:$HOME/.local/share/JetBrains/Toolbox/bin"

# file manager
export FILE=nnn

# bat
export BAT_THEME="OneHalfDark"

# scripts
. $HOME/.config/bash/node.sh
. $HOME/.config/bash/rust.sh
. $HOME/.config/bash/tmux.sh

# zoxide
if command -v zoxide &>/dev/null; then
    source <(zoxide init bash)
fi

# starship
if command -v starship &>/dev/null; then
    source <(starship init bash)
fi
