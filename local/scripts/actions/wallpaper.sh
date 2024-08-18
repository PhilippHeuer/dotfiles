#!/usr/bin/env bash

# current theme
THEME=$(cat ~/.local/state/dotfiles/current-theme)

# show gui
show_gui() {
    waypaper --folder ~/.local/share/backgrounds/${THEME} --state-file ~/.local/state/waypaper/${THEME}.ini
}

# set random wallpaper
set_random() {
    waypaper --folder ~/.local/share/backgrounds/${THEME} --state-file ~/.local/state/waypaper/${THEME}.ini --random
}

# restore last wallpaper
restore() {
    if [ -f ~/.local/state/waypaper/${THEME}.ini ]; then
        waypaper --folder ~/.local/share/backgrounds/${THEME} --state-file ~/.local/state/waypaper/${THEME}.ini --restore
    else
        set_random
    fi
}

# main
case "$1" in
    gui)
        show_gui
        ;;
    random)
        set_random
        ;;
    restore)
        restore
        ;;
    *)
        echo "Usage: $0 {gui|random|restore}"
        exit 1
        ;;
esac
