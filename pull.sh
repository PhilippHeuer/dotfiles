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

# foot terminal
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/foot/main/themes/catppuccin-mocha.ini" -o "config/foot/themes/catppuccin-mocha.ini"
curl -S -s -L "https://codeberg.org/dnkl/foot/raw/branch/master/themes/tokyonight-storm" -o "config/foot/themes/tokyo-night.ini"
curl -S -s -L "https://raw.githubusercontent.com/EuCaue/foot/main/rose-pine" -o "config/foot/themes/rose-pine.ini"
curl -S -s -L "https://codeberg.org/dnkl/foot/raw/branch/master/themes/nord" -o "config/foot/themes/nord.ini"

# kitty
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/kitty/main/themes/mocha.conf" -o "config/kitty/themes/catppuccin-mocha.conf"
curl -S -s -L "https://raw.githubusercontent.com/davidmathers/tokyo-night-kitty-theme/trunk/tokyo-night-kitty.conf" -o "config/kitty/themes/tokyo-night.conf"
curl -S -s -L "https://raw.githubusercontent.com/rose-pine/kitty/main/dist/rose-pine.conf" -o "config/kitty/themes/rose-pine.conf"
curl -S -s -L "https://raw.githubusercontent.com/connorholyday/nord-kitty/master/nord.conf" -o "config/kitty/themes/nord.conf"

# bat themes
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Frappe.tmTheme" -o "config/bat/themes/catppuccin-frappe.tmTheme"
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Latte.tmTheme" -o "config/bat/themes/catppuccin-latte.tmTheme"
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Macchiato.tmTheme" -o "config/bat/themes/catppuccin-macchiato.tmTheme"
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Mocha.tmTheme" -o "config/bat/themes/catppuccin-mocha.tmTheme"

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
curl -S -s -L "https://raw.githubusercontent.com/rose-pine/i3/main/themes/rose-pine.theme" -o "config/sway/themes/rose-pine"
curl -S -s -L "https://raw.githubusercontent.com/rose-pine/i3/main/themes/rose-pine-moon.theme" -o "config/sway/themes/rose-pine-moon"
curl -S -s -L "https://raw.githubusercontent.com/rose-pine/i3/main/themes/rose-pine-dawn.theme" -o "config/sway/themes/rose-pine-dawn"

# lazygit
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/lazygit/main/themes-mergable/mocha/blue.yml" -o "config/lazygit/themes/mocha-blue.yml"

# git-delta
#curl -S -s -L "https://raw.githubusercontent.com/Anomalocaridid/delta/main/themes/mocha.gitconfig" -o "config/git/delta-themes/catppuccin-mocha.gitconfig"

# k9s
curl -S -s -L "https://raw.githubusercontent.com/catppuccin/k9s/main/dist/catppuccin-mocha-transparent.yaml" -o "config/k9s/skins/catppuccin-mocha.yaml"
curl -S -s -L "https://raw.githubusercontent.com/axkirillov/k9s-tokyonight/main/skin.yml" -o "config/k9s/skins/tokyo-night.yaml"
curl -S -s -L "https://raw.githubusercontent.com/derailed/k9s/master/skins/rose-pine.yaml" -o "config/k9s/skins/rose-pine.yaml"
curl -S -s -L "https://raw.githubusercontent.com/derailed/k9s/master/skins/nord.yaml" -o "config/k9s/skins/nord.yaml"

# k9s transparent background
sed -i -E 's/background: &background "\#[0-9a-fA-F]{6}"/background: \&background "default"/' "config/k9s/skins/tokyo-night.yaml"
sed -i -E 's/background: &background "\#[0-9a-fA-F]{6}"/background: \&background "default"/' "config/k9s/skins/rose-pine.yaml"
sed -i -E 's/background: &background "\#[0-9a-fA-F]{6}"/background: \&background "default"/' "config/k9s/skins/nord.yaml"
