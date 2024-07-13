#!/usr/bin/env bash

# location vpn override
location=""

# short form for waybar or full report for terminal
if [ "$1" = "full" ]; then
  weather_info=$(curl -s wttr.in/$location | head -n -2)
  echo "$weather_info"

  sleep 600
  exit 0
elif [ "$1" = "short" ]; then
  curl -s wttr.in/$location?format="%c+%t+%p+%w" | awk -F "+" '{print $1 " " $2 " " $3 " " $4}'
  exit 0
else
  echo "Error: invalid argument provided. Exiting."
  exit 1
fi
