#!/usr/bin/env bash

# bash config
rm -rf $HOME/.config/bash
ln -s $(pwd)/config/bash $HOME/.config/bash

# ansible config
rm -rf $HOME/.ansible.cfg
ln -s $(pwd)/config/ansible/ansible.cfg $HOME/.ansible.cfg

# tmux config - for each file in $(pwd)/config/tmux
mkdir -p $HOME/.config/tmux
for path in $(pwd)/config/tmux/*; do
  filename=$(basename "$path")
  rm "$HOME/.config/tmux/$filename" 2> /dev/null
  ln -s "$path" "$HOME/.config/tmux/$filename"
done
tmux source $HOME/.config/tmux/tmux.conf # force reload tmux config

# neovim
rm -rf $HOME/.config/nvim 2> /dev/null
ln -s $(pwd)/config/nvim $HOME/.config/nvim

# nushell
rm -rf $HOME/.config/nushell
ln -s $(pwd)/config/nushell $HOME/.config/nushell

# starship
rm -rf $HOME/.config/starship.toml 2> /dev/null
ln -s $(pwd)/config/starship.toml $HOME/.config/starship.toml

# k9s
mkdir -p $HOME/.config/k9s
rm -rf $HOME/.config/k9s/skin.yml
ln -s $(pwd)/config/k9s/skin.yml $HOME/.config/k9s/skin.yml

# zellij
rm -rf $HOME/.config/zellij
ln -s $(pwd)/config/zellij $HOME/.config/zellij
