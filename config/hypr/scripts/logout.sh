#!/usr/bin/env bash

# check if wlogout is already running
if pgrep -x "wlogout" > /dev/null
then
    pkill -x "wlogout"
    exit 0
fi

# set file variables
layoutFile="${XDG_CONFIG_HOME:-$HOME/.config}/wlogout/layout"
styleFile="${XDG_CONFIG_HOME:-$HOME/.config}/wlogout/style.css"

# detect monitor res
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')

# scale config layout and style
export x_mgn=$(( x_mon * 35 / hypr_scale ))
export y_mgn=$(( y_mon * 25 / hypr_scale ))
export x_hvr=$(( x_mon * 32 / hypr_scale ))
export y_hvr=$(( y_mon * 20 / hypr_scale ))

# theme and font size
export waybarTheme="Catppuccin-Mocha"
export fontSize=$(( y_mon * 2 / 100 ))
export gtkMode="dark"

# detect gtk system theme
export BtnCol=`[ "$gtkMode" == "dark" ] && ( echo "white" ) || ( echo "black" )`
export WindBg=`[ "$gtkMode" == "dark" ] && ( echo "rgba(0,0,0,0.5)" ) || ( echo "rgba(255,255,255,0.5)" )`

# eval hypr border radius
export active_rad=$(( hypr_border * 5 ))
export button_rad=$(( hypr_border * 8 ))

# eval config files
style=`envsubst < $styleFile`

# launch wlogout
wlogout -b 2 -c 0 -r 0 -m 0 --layout $layoutFile --css <(echo "$style") --protocol layer-shell
