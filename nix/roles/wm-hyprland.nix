{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    waybar
    blueman # GTK-based Bluetooth Manager
    networkmanagerapplet # NetworkManager Control Applet
    dunst # lightweight and customizable notification daemon
    wl-clipboard # clipboard manager
    brightnessctl # control screen brightness
    pamixer # control audio volume from the command line
    swww # wayland wallpaper daemon
    wlogout # logout menu
    swaylock-effects # needed for logout menu (swaylock with screenshot + blur)
    gettext # needed by hyprland scripts
    jq # needed by hyprland scripts
    cliphist # clipboard history
  ];

  # swaylock needs setuid to lock the screen
  security.pam.services.swaylock = {
    fprintAuth = false;
  };
}
