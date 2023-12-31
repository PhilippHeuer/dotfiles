#!/usr/bin/env bash

# properties
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# restore permissions
chmod +x "$script_dir"/bin/* "$script_dir"/**/*.sh

# install dotfiles
export DOTFILE_THEME="catppuccin-mocha"
dotfiles install "$script_dir" --mode symlink
