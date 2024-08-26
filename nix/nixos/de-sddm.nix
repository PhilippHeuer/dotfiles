{ pkgs, pkgs-unstable, inputs, ... }:

{
  # sddm settings
  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    settings.Theme.CursorTheme = "Bibata-Modern-Ice";
    wayland.enable = true;
  };

  # sddm themes
  environment.systemPackages = [
    # wallpapers
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.wallpapers

    # sddm theme
    (pkgs-unstable.sddm-astronaut.override {
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
}
