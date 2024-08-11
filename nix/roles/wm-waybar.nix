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
    swww # wayland wallpaper daemon
    # waypaper # wallpaper manager
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.waypaper # wallpaper manager
    wlogout # logout menu
    swaylock-effects # needed for logout menu (swaylock with screenshot + blur)
    xdg-utils # for opening default programs when clicking links
    hyprpicker # wlroots color picker

    # process management
    htop # interactive process viewer
    btop # resource monitor
    gnome.gnome-system-monitor # system monitor

    # notifications
    dunst # lightweight and customizable notification daemon
    swaynotificationcenter # sway notification center
    libnotify # notification library, send notifications
  ];
}
