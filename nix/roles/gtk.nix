{
  pkgs,
  ...
}:

let
  catppuccin-mocha = pkgs.catppuccin-gtk.override {
    accents = [
      "blue"
      "flamingo"
      "green"
      "lavender"
      "maroon"
      "mauve"
      "peach"
      "pink"
      "red"
      "rosewater"
      "sapphire"
      "sky"
      "teal"
      "yellow"
    ];
    size = "standard";
    variant = "mocha";
  };
in
{
  # gtk themes
  environment.systemPackages = [
    # gnome
    pkgs.gnome3.adwaita-icon-theme

    # catppuccin
    catppuccin-mocha
    pkgs.catppuccin-cursors

    # tokyonight
    pkgs.tokyo-night-gtk

    # rosepine
    pkgs.rose-pine-gtk-theme
    pkgs.rose-pine-cursor

    # nord
    pkgs.nordic

    # dracula
    pkgs.dracula-theme

    # bibata cursors
    pkgs.bibata-cursors

    # papirus icon theme
    pkgs.papirus-icon-theme
  ];
}
