#!/usr/bin/env bash

# using the swaylock fork with blur and screenshot support (https://github.com/mortie/swaylock-effects)
swaylock \
  --screenshots \
  --clock \
  --datestr "%d.%m.%Y" \
  --timestr "%H:%M" \
  --indicator \
  --indicator-radius 100 \
  --indicator-thickness 7 \
  --effect-blur 7x5 \
  --effect-vignette 0.5:0.5 \
  --ring-color bb00cc \
  --key-hl-color 880033 \
  --line-color 00000000 \
  --inside-color 00000088 \
  --separator-color 00000000 \
  --fade-in 0.2
