#!/usr/bin/env bash

###
# Pulls scripts from their respective repositories.
#

# fzf
curl -S -s -L "https://raw.githubusercontent.com/lincheney/fzf-tab-completion/master/bash/fzf-bash-completion.sh" -o "config/bash/init/fzf-bash-completion.sh"

###
# Pulls the latest versions of the themes from their respective repositories.
#

# alacritty themes
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-mocha.toml" -o "config/alacritty/themes/catppuccin-mocha.toml"
curl -S -s -L "https://raw.githubusercontent.com/rose-pine/alacritty/main/dist/rose-pine.toml" -o "config/alacritty/themes/rose-pine.toml"

# kitty
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/kitty/main/themes/mocha.conf" -o "config/kitty/themes/catppuccin-mocha.conf"
curl -S -s -L "https://raw.githubusercontent.com/davidmathers/tokyo-night-kitty-theme/trunk/tokyo-night-kitty.conf" -o "config/kitty/themes/tokyo-night.conf"
curl -S -s -L "https://raw.githubusercontent.com/rose-pine/kitty/main/dist/rose-pine.conf" -o "config/kitty/themes/rose-pine.conf"
curl -S -s -L "https://raw.githubusercontent.com/connorholyday/nord-kitty/master/nord.conf" -o "config/kitty/themes/nord.conf"

# bat themes
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-frappe.tmTheme" -o "config/bat/themes/Catppuccin-frappe.tmTheme"
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-latte.tmTheme" -o "config/bat/themes/Catppuccin-latte.tmTheme"
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-macchiato.tmTheme" -o "config/bat/themes/Catppuccin-macchiato.tmTheme"
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme" -o "config/bat/themes/Catppuccin-mocha.tmTheme"

# btop themes
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_frappe.theme" -o "config/btop/themes/catppuccin_frappe.theme"
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_latte.theme" -o "config/btop/themes/catppuccin_latte.theme"
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_macchiato.theme" -o "config/btop/themes/catppuccin_macchiato.theme"
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_mocha.theme" -o "config/btop/themes/catppuccin_mocha.theme"
sed -i 's/theme\[main_bg\]="#[0-9A-Fa-f]\{6\}"/theme[main_bg]=""/' config/btop/themes/*.theme

# sway themes
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/i3/main/themes/catppuccin-frappe" -o "config/sway/themes/catppuccin-frappe"
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/i3/main/themes/catppuccin-latte" -o "config/sway/themes/catppuccin-latte"
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/i3/main/themes/catppuccin-macchiato" -o "config/sway/themes/catppuccin-macchiato"
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/i3/main/themes/catppuccin-mocha" -o "config/sway/themes/catppuccin-mocha"

# lazygit
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/lazygit/main/themes-mergable/mocha/blue.yml" -o "config/lazygit/themes/mocha-blue.yml"

# git-delta
curl -S -s -L "https://raw.githubusercontent.com/Anomalocaridid/delta/main/themes/mocha.gitconfig" -o "config/git/delta-themes/catppuccin-mocha.gitconfig"
