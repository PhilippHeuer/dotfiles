{ pkgs, ... }:

{
  # sddm themes
  environment.systemPackages = [
    pkgs.catppuccin-sddm
    pkgs.bibata-cursors
  ];

  # sddm settings
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
    settings.Theme.CursorTheme = "Bibata-Modern-Ice";
    wayland.enable = true;
  };
}
