#!/usr/bin/env bash

# properties
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# fix permissions
chmod +x "$script_dir/setup.sh"
find "$script_dir/local/bin" -type f -exec sh -c 'chmod +x "$1" && git update-index --chmod=+x "$1"' _ {} \;
find "$script_dir/local/scripts" -type f -exec sh -c 'chmod +x "$1" && git update-index --chmod=+x "$1"' _ {} \;

# install dotfiles
dotfiles install "$script_dir" --mode symlink

# clean up broken symlinks
# find -L ~/.config -maxdepth 3 -type l -delete
find -L ~/.local/share/backgrounds -maxdepth 3 -type l -delete

# rebuild bat cache
# bat cache --build
# cd ~/.config/bat && silicon --build-cache

# gh cli extensions
# gh extension install github/gh-copilot
# gh extension upgrade gh-copilot
