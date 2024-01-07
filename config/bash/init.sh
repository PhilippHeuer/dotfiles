#!/usr/bin/env bash

# dumb terminal (e. g. rsync)
if [ "$TERM" = "dumb" ]; then
  return 0
fi

# path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/node/bin" # node
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts:$HOME/.local/share/JetBrains/Toolbox/bin" # jetbrains toolbox and apps
export PATH="$PATH:$HOME/.config/bin" # scripts

# gpg tty
export GPG_TTY=$(tty)

# rust
if [ -f $HOME/.cargo/env ]; then
  . $HOME/.cargo/env
fi

# registry auth
export REGISTRY_AUTH_FILE="$HOME/.config/containers/auth.json"

# editor
export EDITOR="nvim"

# source scripts (sorted by name, log duration)
script_files=$(find -L "$HOME/.config" -maxdepth 3 -type f -path "*/init/*.sh" | sort)
echo "" > "$HOME/.local/share/bash.log" # clear log
for script in $script_files; do
  start_time=$(date +%s%N)
  source "$script"
  end_time=$(date +%s%N)
  duration=$(( (end_time - start_time) / 1000000 )) # convert nanoseconds to milliseconds
  echo "script: $script, duration: ${duration}ms" >> "$HOME/.local/share/bash.log"
done

# aliases
. $HOME/.config/bash/aliases.sh

# print system info
[[ -n $TMUX_PANE ]] || fastfetch
