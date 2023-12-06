#!/bin/bash

###
# Pulls the latest versions of the themes from their respective repositories.
#

# alacritty themes
curl -L "https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-frappe.yml" -o "config/alacritty/themes/catppuccin-frappe.yml"
curl -L "https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-latte.yml" -o "config/alacritty/themes/catppuccin-latte.yml"
curl -L "https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-macchiato.yml" -o "config/alacritty/themes/catppuccin-macchiato.yml"
curl -L "https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-mocha.yml" -o "config/alacritty/themes/catppuccin-mocha.yml"

# bat themes
curl -L "https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-frappe.tmTheme" -o "config/bat/themes/Catppuccin-frappe.tmTheme"
curl -L "https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-latte.tmTheme" -o "config/bat/themes/Catppuccin-latte.tmTheme"
curl -L "https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-macchiato.tmTheme" -o "config/bat/themes/Catppuccin-macchiato.tmTheme"
curl -L "https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme" -o "config/bat/themes/Catppuccin-mocha.tmTheme"

# btop themes
curl -L "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_frappe.theme" -o "config/btop/themes/catppuccin_frappe.theme"
curl -L "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_latte.theme" -o "config/btop/themes/catppuccin_latte.theme"
curl -L "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_macchiato.theme" -o "config/btop/themes/catppuccin_macchiato.theme"
curl -L "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_mocha.theme" -o "config/btop/themes/catppuccin_mocha.theme"
