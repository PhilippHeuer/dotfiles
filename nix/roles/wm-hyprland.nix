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
    xdg-utils # for opening default programs when clicking links
  ];

  # desktop ipc
  services.dbus.enable = true;

  # xdg-desktop-portal exposes a series of D-Bus interfaces (APIs for file access, opening URIs, printing, etc)
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # gui based authentication agent
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      enable = true;
      description = "Authentication agent for PolicyKit";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # swaylock needs setuid to lock the screen
  security.pam.services.swaylock = {
    fprintAuth = false;
  };
}
