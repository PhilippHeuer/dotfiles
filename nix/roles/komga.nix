{ pkgs, pkgs-unstable, ... }:

{
  # systemd container
  virtualisation.oci-containers.containers = {
    komga = {
      # renovate: datasource=docker depName=ghcr.io/gotson/komga
      image = "ghcr.io/gotson/komga:1.10.4";
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
