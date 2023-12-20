#!/usr/bin/env bash

# always source ~/.profile
#. ~/.profile

# append .local/bin to PATH
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

case $- in *i*) . ~/.bashrc;; esac
