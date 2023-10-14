#!/usr/bin/env bash

# bash config
rm -rf $HOME/.config/bash
ln -s $(pwd)/.config/bash $HOME/.config/bash

# ansible config
rm -rf $HOME/.ansible.cfg
ln -s $(pwd)/.config/ansible/ansible.cfg $HOME/.ansible.cfg

# tmux config - for each file in $(pwd)/.config/tmux
mkdir -p $HOME/.config/tmux
for path in $(pwd)/.config/tmux/*; do
  filename=$(basename "$path")
  rm "$HOME/.config/tmux/$filename" 2> /dev/null
  ln -s "$path" "$HOME/.config/tmux/$filename"
done
tmux source $HOME/.config/tmux/tmux.conf # force reload tmux config

# neovim
rm -rf $HOME/.config/nvim 2> /dev/null
ln -s $(pwd)/.config/nvim $HOME/.config/nvim

# starship
rm -rf $HOME/.config/starship.toml 2> /dev/null
ln -s $(pwd)/.config/starship.toml $HOME/.config/starship.toml
