{
  pkgs,
  pkgs-unstable,
  inputs,
  lib,
  ...
}:

{
  # sddm settings
  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    settings.Theme.CursorTheme = "Bibata-Modern-Ice";
    wayland.enable = true;
    package = lib.mkForce pkgs.kdePackages.sddm; # qt6 sddm version
    extraPackages = [
      # sddm theme
      (pkgs.sddm-astronaut.override {
        themeConfig = {
          # [Background]
          CustomBackground = "true";
          Background = "${inputs.nixpkgs-philippheuer.packages.${pkgs.system}.wallpapers}/share/backgrounds/catppuccin-mocha/nice-blue-background.png";

          # [Blur Settings]
          FullBlur = "false";
          PartialBlur = "true";
          BlurRadius = "80";

          # [Design Customizations]
          FormPosition = "left";
          Font = "JetBrainsMono Nerd Font Mono";
          FontSize = "9";

          # [Interface Behavior]
          ForceHideVirtualKeyboardButton = "true";
        };
      })
    ];
  };

  # sddm themes
  environment.systemPackages = [
    # wallpapers
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.wallpapers
  ];
}
