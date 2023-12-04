#!/usr/bin/env bash

# properties
image_dir="$HOME/.local/share/backgrounds"
lock_file="/tmp/sway-background-script.lock"
last_pid=""

# check lock file
if [ -e "$lock_file" ]; then
  echo "Script is already running. Exiting."
  exit 1
fi
echo $$ > "$lock_file"

# cleanup
cleanup() {
  rm -f "$lock_file"
  if [ -n "$last_pid" ]; then
    kill "$last_pid"
  fi
  exit 0
}
trap cleanup EXIT TERM INT HUP QUIT ABRT

# logic
while true; do
  bgimage=$(find "$image_dir/." -type f | shuf -n1)
  if [ -z "$bgimage" ]; then
    echo "No images found in $image_dir"
    exit 1
  fi

  (swaybg -i $bgimage -m fill) &
  new_pid=$!
  sleep 1

  if [ -n "$last_pid" ]; then
    kill $last_pid
  fi
  last_pid=$new_pid
  sleep 300
done
