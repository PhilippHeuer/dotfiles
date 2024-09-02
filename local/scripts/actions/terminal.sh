#!/usr/bin/env bash

# arguments
title=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --title)
      title="$2"
      shift 2
      ;;
    *)
      break
      ;;
  esac
done

# start terminal
if command -v kitty &> /dev/null; then
  exec kitty --title "${title:-kitty}" --working-directory "$cwd" $@
elif command -v foot &> /dev/null; then
  exec foot --title="${title:-foot}" --working-directory="$cwd" $@
elif command -v alacritty &> /dev/null; then
  exec alacritty --title "${title:-alacritty}" --working-directory "$cwd" -e $@
else
  echo "No terminal emulator found"
  exit 1
fi
