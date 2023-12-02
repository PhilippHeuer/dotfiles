#!/usr/bin/env bash

# properties
image_dir="$HOME/.local/share/backgrounds"
last_pid=""

# cleanup
cleanup() {
  if [ -n "$last_pid" ]; then
    kill "$last_pid"
  fi
}
trap cleanup EXIT

# logic
while true; do
  (swaybg -i $(find "$image_dir/." -type f | shuf -n1) -m fill) &
  new_pid=$!
  sleep 1

  if [ -n "$last_pid" ]; then
    kill $last_pid
  fi
  last_pid=$new_pid
  sleep 300
done
