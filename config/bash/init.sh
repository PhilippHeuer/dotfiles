#!/usr/bin/env bash

# defaults
export TERM=xterm-256color
export GPG_TTY=$(tty)

# paths
export PATH="$PATH:~/.local/bin:~/.local/share/JetBrains/Toolbox/scripts:~/.local/share/JetBrains/Toolbox/bin"

# scripts
. $HOME/.config/bash/node.sh
. $HOME/.config/bash/rust.sh
. $HOME/.config/bash/tmux.sh

# carapace aliases
if command -v carapace &>/dev/null; then
    source <(carapace _carapace)
fi

# zoxide
if command -v zoxide &>/dev/null; then
    source <(zoxide init bash)
fi

# starship
if command -v starship &>/dev/null; then
    source <(starship init bash)
fi
