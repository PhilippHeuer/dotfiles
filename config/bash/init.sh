#!/usr/bin/env bash

# defaults
export TERM=xterm-256color

# gpg
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >> ~/.local/share/gpg-agent.log 2>&1

# path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/node/bin" # node
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts:$HOME/.local/share/JetBrains/Toolbox/bin" # jetbrains toolbox and apps
export PATH="$PATH:$HOME/.config/bin" # scripts

# ssh auth agent
if [ -z "$SSH_AUTH_SOCK" -a -n "$XDG_RUNTIME_DIR" ]; then
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket) # gpg-agent
  # export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" # ssh-agent
fi

# ansible
export ANSIBLE_CONFIG="$HOME/.config/ansible/ansible.cfg"

# bat
export BAT_THEME="OneHalfDark"

# lazygit
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/themes/mocha-blue.yml"

# rust
if [ -f $HOME/.cargo/env ]; then
  . $HOME/.cargo/env
fi

# registry auth
export REGISTRY_AUTH_FILE="$HOME/.config/containers/auth.json"

# editor
export EDITOR="nvim"

# tmux
. $HOME/.config/bash/tmux.sh

# zoxide
if command -v zoxide &>/dev/null; then
    source <(zoxide init bash)
fi

# starship
if command -v starship &>/dev/null; then
    source <(starship init bash)
fi

# aliases
. $HOME/.config/bash/aliases.sh

# print system info
[[ -n $TMUX_PANE ]] || fastfetch
