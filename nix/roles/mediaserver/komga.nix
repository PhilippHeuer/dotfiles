{ pkgs, lib, ... }:

let
  # renovate: datasource=docker depName=ghcr.io/gotson/komga
  version = "1.23.4";
in
{
  # systemd container
  virtualisation.oci-containers.containers = {
    komga = {
      image = "ghcr.io/gotson/komga:" + version;
      autoStart = true;
      ports = [ "25600:25600/tcp" ];
      volumes = [
        "/var/lib/komga/config:/config"
        "/var/lib/komga/data:/data"
        "/mnt/ironwolf_zl22hc50/Literature:/mnt/ironwolf_zl22hc50/Literature"
      ];
    };
  };

  services.traefik.dynamicConfigOptions.http.routers.komga = {
    rule = lib.mkDefault "Host(`komga.home`)";
    service = "komga";
    entrypoints = [ "web" "websecure" ];
  };
  services.traefik.dynamicConfigOptions.http.services.komga = {
    loadBalancer = {
      servers = [
        {
          url = "http://localhost:25600";
        }
      ];
    };
  };
}
