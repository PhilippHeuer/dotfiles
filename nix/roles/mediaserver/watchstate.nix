{ pkgs, lib, ... }:

let
  # renovate: datasource=docker depName=ghcr.io/arabcoders/watchstate
  version = "1.0.8";
in
{
  # systemd container
  virtualisation.oci-containers.containers = {
    watchstate = {
      image = "ghcr.io/arabcoders/watchstate:v" + version;
      autoStart = true;
      ports = [ "25699:8080/tcp" ];
      user = "0:0";
      volumes = [
        "/var/lib/watchstate/config:/config"
      ];
    };
  };

  services.traefik.dynamicConfigOptions.http.routers.watchstate = {
    rule = lib.mkDefault "Host(`watchstate.home`)";
    service = "watchstate";
    entrypoints = [ "web" "websecure" ];
  };
  services.traefik.dynamicConfigOptions.http.services.watchstate = {
    loadBalancer = {
      servers = [
        {
          url = "http://localhost:25699";
        }
      ];
    };
  };
}
