#!/usr/bin/env bash

# diskfree
alias df="df -h"

# free memory
alias free="free -mt"

# journalctl
alias jctl="journalctl -p 3 -xb"

# use nnn as file manager
alias l="eza --long --header"

# modern apt replacement
alias apt="sudo nala"

# usb devices
alias list-usb="cyme -t -v" # tree, verbose

# network
alias list-adapters="nmcli dev status"
alias list-wifi="nmcli dev wifi list"
alias list-connections="nmcli con show"
alias logs-network="sudo journalctl -fu NetworkManager"

# gh copilot suggest
ghc-suggest() {
  context="Shell: $(basename $SHELL), Distro: $(source /etc/os-release && echo $NAME), Editor: $EDITOR"
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    context="$context, Git Repo, Preferred Tools: rg, bat"
  fi

  request="$@. $context"
  echo "REQUEST: $request"
  gh copilot suggest -t shell "$request"
}
alias ghs="ghc-suggest"

# gh copilot explain
# output: remove the first 8 lines with the banner, remove 2 leading spaces, remove trailing empty lines 
ghc-explain() {
  gh copilot explain "$@" | tail -n +8 | sed -E 's/^ {0,2}//' | sed -e :a -e '/^\n*$/{$d;N;ba' -e '}'
}
alias ghe="ghc-explain"
