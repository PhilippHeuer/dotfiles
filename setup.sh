#!/usr/bin/env bash

# properties
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# fix permissions
chmod +x "$script_dir"/local/scripts/*

# install dotfiles
export DOTFILE_THEME="catppuccin-mocha"
dotfiles install "$script_dir" --mode symlink

# rebuild bat cache
# bat cache --build
# cd ~/.config/bat && silicon --build-cache
