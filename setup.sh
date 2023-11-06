#!/usr/bin/env bash

# properties
config_dir="$(pwd)/config"
destination_dir="$HOME/.config"

cd "$config_dir" || exit

find . -type d -exec mkdir -p "$destination_dir/{}" \; # sync directories
find . -type f -exec sh -c 'ln -sf "$(readlink -f "$0")" "$1/$0"' {} "$destination_dir" \; # symlink files

# scripts
for path in $(pwd)/scripts/*; do
  filename=$(basename "$path")
  ln -sf "$path" "$HOME/.local/bin/$filename"
done

# reload
tmux source $HOME/.config/tmux/tmux.conf
