{ pkgs, ... }:

{
  services.immich = {
    accelerationDevices = null; # Access all devices
    enable = true;
    host = "0.0.0.0";
    port = 2283;
    openFirewall = true;
    machine-learning.enable = true;
    settings = null;
    user = "immich";
    group = "veracrypt-volume";
  };

  services.traefik.dynamicConfigOptions.http.routers.immich = {
    rule = "Host(`immich.home`)";
    service = "immich";
    entrypoints = [ "web" "websecure" ];
  };
  services.traefik.dynamicConfigOptions.http.services.immich = {
    loadBalancer = {
      servers = [
        {
          url = "http://localhost:2283";
        }
      ];
    };
  };
}
