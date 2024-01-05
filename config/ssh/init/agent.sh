#!/usr/bin/env bash

# ssh auth agent
if [ -z "$SSH_AUTH_SOCK" -a -n "$XDG_RUNTIME_DIR" ]; then
  # ssh agent
  if pgrep -x ssh-agent > /dev/null; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
  fi

  # gpg agent
  if pgrep -x ssh-agent > /dev/null; then
    gpg-connect-agent updatestartuptty /bye >> ~/.local/share/gpg-agent.log 2>&1
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  fi
fi
