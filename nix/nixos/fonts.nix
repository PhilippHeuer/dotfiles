{ pkgs, ... }:

{
  fonts = {
    # enable default fonts
    enableDefaultPackages = true;

    # creates /run/current-system/sw/share/X11/fonts
    fontDir.enable = true;

    # install fonts
    packages = with pkgs; [
      fira-code
      jetbrains-mono
      material-design-icons
      noto-fonts-color-emoji
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
        ];
      })
    ];

    # set default fonts
    fontconfig = {
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "JetBrainsMono Nerd Font Mono"
          "Noto Sans Mono CJK SC"
          "Sarasa Mono SC"
          "DejaVu Sans Mono"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Source Han Sans SC"
          "DejaVu Sans"
        ];
        serif = [
          "Noto Serif CJK SC"
          "Source Han Serif SC"
          "DejaVu Serif"
        ];
      };
    };
  };
}
