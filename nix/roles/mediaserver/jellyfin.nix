{ pkgs, pkgs-unstable, lib, ... }:

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
    rule = lib.mkDefault "Host(`jellyfin.home`)";
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

  # firewall (8096 = jellyfin)
  networking.firewall.allowedTCPPorts = [ 8096 ];
}
