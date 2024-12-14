#!/usr/bin/env bash

###
# Functions

function download_file {
    local url=$1
    local file=$2
    echo "downloading $url to $file ..."
    curl -S -s -L "$url" -o "$file"
}

###
# Pulls scripts from their respective repositories.
#

# fzf
download_file "https://raw.githubusercontent.com/lincheney/fzf-tab-completion/master/bash/fzf-bash-completion.sh" "config/bash/init/fzf-bash-completion.sh"

###
# Pulls the latest versions of the themes from their respective repositories.
#

# alacritty
download_file "https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-mocha.toml" "config/alacritty/themes/catppuccin-mocha.toml"
download_file "https://raw.githubusercontent.com/rose-pine/alacritty/main/dist/rose-pine.toml" "config/alacritty/themes/rose-pine.toml"

# foot terminal
download_file "https://raw.githubusercontent.com/catppuccin/foot/main/themes/catppuccin-mocha.ini" "config/foot/themes/catppuccin-mocha.ini"
download_file "https://codeberg.org/dnkl/foot/raw/branch/master/themes/tokyonight-storm" "config/foot/themes/tokyo-night.ini"
download_file "https://raw.githubusercontent.com/EuCaue/foot/main/rose-pine" "config/foot/themes/rose-pine.ini"
download_file "https://codeberg.org/dnkl/foot/raw/branch/master/themes/nord" "config/foot/themes/nord.ini"

# kitty
download_file "https://raw.githubusercontent.com/catppuccin/kitty/main/themes/mocha.conf" "config/kitty/themes/catppuccin-mocha.conf"
download_file "https://raw.githubusercontent.com/davidmathers/tokyo-night-kitty-theme/trunk/tokyo-night-kitty.conf" "config/kitty/themes/tokyo-night.conf"
download_file "https://raw.githubusercontent.com/rose-pine/kitty/main/dist/rose-pine.conf" "config/kitty/themes/rose-pine.conf"
download_file "https://raw.githubusercontent.com/connorholyday/nord-kitty/master/nord.conf" "config/kitty/themes/nord.conf"

# bat
download_file "https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Frappe.tmTheme" "config/bat/themes/catppuccin-frappe.tmTheme"
download_file "https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Latte.tmTheme" "config/bat/themes/catppuccin-latte.tmTheme"
download_file "https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Macchiato.tmTheme" "config/bat/themes/catppuccin-macchiato.tmTheme"
download_file "https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Mocha.tmTheme" "config/bat/themes/catppuccin-mocha.tmTheme"

# btop
download_file "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_frappe.theme" "config/btop/themes/catppuccin_frappe.theme"
download_file "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_latte.theme" "config/btop/themes/catppuccin_latte.theme"
download_file "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_macchiato.theme" "config/btop/themes/catppuccin_macchiato.theme"
download_file "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_mocha.theme" "config/btop/themes/catppuccin_mocha.theme"

# btop transparent background
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
download_file "https://raw.githubusercontent.com/catppuccin/lazygit/main/themes-mergable/mocha/blue.yml" "config/lazygit/themes/mocha-blue.yml"

# git-delta
#curl -S -s -L "https://raw.githubusercontent.com/Anomalocaridid/delta/main/themes/mocha.gitconfig" -o "config/git/delta-themes/catppuccin-mocha.gitconfig"

# k9s
download_file "https://raw.githubusercontent.com/catppuccin/k9s/main/dist/catppuccin-mocha-transparent.yaml" "config/k9s/skins/catppuccin-mocha.yaml"
download_file "https://raw.githubusercontent.com/axkirillov/k9s-tokyonight/main/skin.yml" "config/k9s/skins/tokyo-night.yaml"
download_file "https://raw.githubusercontent.com/derailed/k9s/master/skins/rose-pine.yaml" "config/k9s/skins/rose-pine.yaml"
download_file "https://raw.githubusercontent.com/derailed/k9s/master/skins/nord.yaml" "config/k9s/skins/nord.yaml"

# k9s transparent background
sed -i -E 's/background: &background "\#[0-9a-fA-F]{6}"/background: \&background "default"/' "config/k9s/skins/tokyo-night.yaml"
sed -i -E 's/background: &background "\#[0-9a-fA-F]{6}"/background: \&background "default"/' "config/k9s/skins/rose-pine.yaml"
sed -i -E 's/background: &background "\#[0-9a-fA-F]{6}"/background: \&background "default"/' "config/k9s/skins/nord.yaml"

# qbittorrent
download_file "https://github.com/catppuccin/qbittorrent/releases/download/v2.0.1/catppuccin-mocha.qbtheme" "config/qBittorrent/themes/catppuccin-mocha.qbtheme"
download_file "https://github.com/catppuccin/qbittorrent/releases/download/v2.0.1/catppuccin-macchiato.qbtheme" "config/qBittorrent/themes/catppuccin-macchiato.qbtheme"
download_file "https://github.com/catppuccin/qbittorrent/releases/download/v2.0.1/catppuccin-latte.qbtheme" "config/qBittorrent/themes/catppuccin-latte.qbtheme"
download_file "https://github.com/catppuccin/qbittorrent/releases/download/v2.0.1/catppuccin-frappe.qbtheme" "config/qBittorrent/themes/catppuccin-frappe.qbtheme"
download_file "https://github.com/rose-pine/qbittorrent/raw/main/dist/main.qbtheme" "config/qBittorrent/themes/rose-pine.qbtheme"
download_file "https://github.com/rose-pine/qbittorrent/raw/main/dist/moon.qbtheme" "config/qBittorrent/themes/rose-pine-moon.qbtheme"
download_file "https://github.com/rose-pine/qbittorrent/raw/main/dist/dawn.qbtheme" "config/qBittorrent/themes/rose-pine-dawn.qbtheme"

# atac
download_file "https://raw.githubusercontent.com/Julien-cpsn/ATAC/main/example_resources/key_bindings/vim_key_bindings.toml" "config/atac/key-bindings/vim_key_bindings.toml"

###
# Pulls and generates shell completions.
#

# nushell completions
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/bat/bat-completions.nu" "config/nushell/completions/bat.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/git/git-completions.nu" "config/nushell/completions/git.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/just/just-completions.nu" "config/nushell/completions/just.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/gradlew/gradlew-completions.nu" "config/nushell/completions/gradlew.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/yarn/yarn-v4-completions.nu" "config/nushell/completions/yarn.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/tar/tar-completions.nu" "config/nushell/completions/tar.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/rg/rg-completions.nu" "config/nushell/completions/rg.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/pre-commit/pre-commit-completions.nu" "config/nushell/completions/pre-commit.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/nix/nix-completions.nu" "config/nushell/completions/nix.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/npm/npm-completions.nu" "config/nushell/completions/npm.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/mvn/mvn-completions.nu" "config/nushell/completions/mvn.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/make/make-completions.nu" "config/nushell/completions/make.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/gh/gh-completions.nu" "config/nushell/completions/gh.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/eza/eza-completions.nu" "config/nushell/completions/eza.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/dotnet/dotnet-completions.nu" "config/nushell/completions/dotnet.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/composer/composer-completions.nu" "config/nushell/completions/composer.nu"
download_file "https://raw.githubusercontent.com/nushell/nu_scripts/refs/heads/main/custom-completions/cargo/cargo-completions.nu" "config/nushell/completions/cargo.nu"
