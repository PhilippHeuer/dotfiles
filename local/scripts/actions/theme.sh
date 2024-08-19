#!/usr/bin/env bash

# theme selection
select_theme() {
    # fzf theme selection
    selectedTheme=$(dotfiles query themes | sort -u | fzf --prompt="Select theme: " --preview="$0 preview {}")
    if [ -z "$selectedTheme" ]; then
      echo "No theme selected"
      exit 1
    fi
    echo "Activating theme: $selectedTheme"

    # activate theme
    DOTFILE_THEME=$selectedTheme dotfiles install --mode symlink
}

# theme preview
theme_preview() {
    # get theme name
    themeName=$1
    if [ -z "$themeName" ]; then
        echo "No theme name provided"
        exit 1
    fi

    # preview theme
    dotfiles query themeoverview $themeName
}

# main
case "$1" in
    select)
        select_theme
        break
        ;;
    preview)
        theme_preview "$2"
        break
        ;;
    *)
        echo "Usage: $0 {select|preview}"
        exit 1
        ;;
esac
