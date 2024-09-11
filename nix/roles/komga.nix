{ pkgs, pkgs-unstable, ... }:

let
  # renovate: datasource=docker depName=ghcr.io/gotson/komga
  version = "1.13.0";
in {
  # systemd container
  virtualisation.oci-containers.containers = {
    komga = {
      image = "ghcr.io/gotson/komga:" + version;
      autoStart = true;
      ports = [ "25600:25600/tcp" ];
      volumes = [
        "/var/lib/komga/config:/config"
        "/var/lib/komga/data:/data"
        "/mnt:/mnt"
      ];
    };
  };
}
