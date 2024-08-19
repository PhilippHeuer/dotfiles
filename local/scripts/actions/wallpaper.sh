#!/usr/bin/env bash

# current theme
THEME=$(dotfiles query theme)

# show gui
show_gui() {
    nohup waypaper --folder $(dotfiles query wallpaperdir) --state-file ~/.local/state/waypaper/${THEME}.ini &
}

# set random wallpaper
set_random() {
    nohup waypaper --folder $(dotfiles query wallpaperdir) --state-file ~/.local/state/waypaper/${THEME}.ini --random &
}

# restore last wallpaper
restore() {
    if [ -f ~/.local/state/waypaper/${THEME}.ini ]; then
        echo "Restoring waypaper state from ~/.local/state/waypaper/${THEME}.ini"
        nohup waypaper --folder $(dotfiles query wallpaperdir) --state-file ~/.local/state/waypaper/${THEME}.ini --restore &
    else
        echo "No waypaper state found, setting random wallpaper"
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
