#!/usr/bin/env bash

# bash config
rm -rf ~/.config/bash
ln -s $(pwd)/.config/bash ~/.config/bash

# tmux config
rm -rf ~/.config/tmux/tmux.conf
ln -s $(pwd)/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf
tmux source ~/.config/tmux/tmux.conf # force reload tmux config

# neovim
rm -rf ~/.config/nvim
ln -s $(pwd)/.config/nvim ~/.config/nvim

# starship
rm -rf ~/.config/starship.toml
ln -s $(pwd)/.config/starship.toml ~/.config/starship.toml
