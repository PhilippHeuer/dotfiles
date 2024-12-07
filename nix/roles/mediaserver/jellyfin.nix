{ pkgs, pkgs-unstable, ... }:

{
  # service
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "phx"; # needed to access mounted media
  };

  # packages
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
