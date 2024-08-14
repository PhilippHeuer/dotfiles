{ pkgs, inputs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # sddm default
  services.displayManager.defaultSession = "hyprland";

  environment.systemPackages = with pkgs; [
    # hyprland packages
    hyprcursor
    hyprlock
    hypridle
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

  # environment
  environment.sessionVariables.WLR_RENDERER_ALLOW_SOFTWARE = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
}
