{ lib, pkgs, config, ... }:

{
  # gtk themes
  environment.systemPackages = with pkgs; [
    # catppuccin
    catppuccin-gtk
    catppuccin-cursors

    # tokyonight
    tokyo-night-gtk

    # rosepine
    rose-pine-gtk-theme

    # nord
    nordic

    # dracula
    dracula-theme
  ];
}
