{ pkgs, lib, ... }:

{
  # systemd container
  virtualisation.oci-containers.containers = {
    sillytavern = {
      image = "ghcr.io/sillytavern/sillytavern:1.13.4";
      autoStart = true;
      ports = [ "3100:8000/tcp" ];
      volumes = [
        "/var/lib/sillytavern/config:/home/node/app/config"
        "/var/lib/sillytavern/data:/home/node/app/data"
        "/var/lib/sillytavern/extensions:/home/node/app/extensions"
        "/var/lib/sillytavern/plugins:/home/node/app/plugins"
      ];
    };
  };

  # firewall for local access
  networking.firewall.allowedTCPPorts = [ 3100 ];
}
