#!/usr/bin/env bash

# properties
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install dotfiles
dotfiles install "$script_dir" --mode symlink

# reload
tmux source $HOME/.config/tmux/tmux.conf
