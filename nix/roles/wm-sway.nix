{ pkgs, ... }:

{
  # enable sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  # packages
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
    cliphist # clipboard history

    xdg-utils # for opening default programs when clicking links
    glib # gsettings
    dracula-theme # gtk theme
    gnome3.adwaita-icon-theme  # default gnome cursors
    grim # screenshot functionality
    slurp # screenshot functionality
    wdisplays # tool to configure displays
  ];

  # xdg-desktop-portal works by exposing a series of D-Bus interfaces
  # known as portals under a well-known name
  # (org.freedesktop.portal.Desktop) and object path
  # (/org/freedesktop/portal/desktop).
  # The portal interfaces include APIs for file access, opening URIs,
  # printing and others.
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
