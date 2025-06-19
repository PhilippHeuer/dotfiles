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

  services.traefik.dynamicConfigOptions.http.routers.jellyfin = {
    rule = "Host(`jellyfin.home`)";
    service = "jellyfin";
    entrypoints = [ "web" "websecure" ];
  };
  services.traefik.dynamicConfigOptions.http.services.jellyfin = {
    loadBalancer = {
      servers = [
        {
          url = "http://localhost:8096";
        }
      ];
    };
  };
}
