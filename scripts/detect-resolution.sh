#!/usr/bin/env bash

# query wayland display info
display_info=$(wayland-info | grep -E 'width: [0-9]+ px, height: [0-9]+ px, refresh: [0-9.]+ Hz,')
display_count=$(echo "$display_info" | wc -l)

# parse display info (primary display)
while IFS= read -r line; do
  width=$(echo "$line" | grep -oP 'width: \K[0-9]+')
  height=$(echo "$line" | grep -oP 'height: \K[0-9]+')
  refresh=$(echo "$line" | grep -oP 'refresh: \K[0-9.]+')

  export RESOLUTION_WIDTH="$width"
  export RESOLUTION_HEIGHT="$height"
  export RESOLUTION_REFRESH="$refresh"
  break
done <<< "$display_info"

# scaling for workstations (>= 2 displays)
if [ "$display_count" -ge 2 ]; then
  export RESOLUTION_SCALE="100"
fi

# scaling for notebooks
if [ "$display_count" -eq 1 ]; then
  export RESOLUTION_SCALE="125"
fi

# echo "screen-info: ${RESOLUTION_WIDTH}x${RESOLUTION_HEIGHT} @ ${RESOLUTION_REFRESH}Hz / SCALE: ${RESOLUTION_SCALE} %"
