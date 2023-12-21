#!/usr/bin/env bash

# require root privileges
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

echo "NormalizeWSL: Starting..."

# move card1 to card0, if card0 does not exist
if [[ -e /dev/dri/card1 && ! -e /dev/dri/card0 ]]; then
  echo "NormalizeWSL: Moving /dev/dri/card1 to /dev/dri/card0"
  mv /dev/dri/card1 /dev/dri/card0
fi

# unmount /tmp/.X11-unix to delegate via xwayland
if findmnt --target "/tmp/.X11-unix" &> /dev/null; then
  echo "NormalizeWSL: Unmounting /tmp/.X11-unix"

  # unmount
  umount /tmp/.X11-unix

  # create empty directory for xwayland
  mkdir -p /tmp/.X11-unix
  chmod 1755 /tmp/.X11-unix/
fi

echo "NormalizeWSL: Done."
