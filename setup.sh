#!/usr/bin/env bash

# properties
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# fix permissions
find "$script_dir/local/bin" -type f -exec chmod +x {} \;
find "$script_dir/local/scripts" -type f -exec chmod +x {} \;

# install dotfiles
dotfiles install "$script_dir" --mode symlink

# rebuild bat cache
# bat cache --build
# cd ~/.config/bat && silicon --build-cache
