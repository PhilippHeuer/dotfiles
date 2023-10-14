#!/usr/bin/env bash

# defaults
export GPG_TTY=$(tty)

# paths
export PATH="$PATH:~/.local/share/JetBrains/Toolbox/scripts:~/.local/share/JetBrains/Toolbox/bin"

# scripts
. $HOME/.config/bash/node.sh
. $HOME/.config/bash/rust.sh
. $HOME/.config/bash/tmux.sh
. $HOME/.config/bash/starship.sh
