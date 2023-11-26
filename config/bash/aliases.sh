#!/bin/bash

# diskfree
alias df="df -h"

# free memory
alias free="free -mt"

# journalctl
alias jctl="journalctl -p 3 -xb"

# use nnn as file manager
alias l="exa --long --header"

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
