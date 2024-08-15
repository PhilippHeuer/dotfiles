{ pkgs, inputs, ... }:

{
  # packages
  environment.systemPackages = with pkgs; [
    # waybar core
    waybar

    # tray utilities
    blueman # GTK-based Bluetooth Manager
    networkmanagerapplet # NetworkManager Control Applet
    brightnessctl # control screen brightness
    pamixer # control audio volume from the command line
    wlogout # logout menu
    xdg-utils # for opening default programs when clicking links
    hyprpicker # wlroots color picker
    # hyprshade

    # wallpaper
    swww # wayland wallpaper daemon
    swaybg # set wallpaper
    mpvpaper # video wallpaper
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.waypaper # wallpaper manager

    # process management
    htop # interactive process viewer
    btop # resource monitor
    gnome.gnome-system-monitor # system monitor
    mission-center # taskmanager-like utility

    # lock screen
    swaylock-effects # needed for logout menu (swaylock with screenshot + blur)

    # notifications
    dunst # lightweight and customizable notification daemon
    swaynotificationcenter # sway notification center
    libnotify # notification library, send notifications
  ];

  # lock screen: swaylock needs setuid to lock the screen
  security.pam.services.swaylock = {
    fprintAuth = false;
  };
}
