{ pkgs, lib, ... }:

{
  # systemd container
  virtualisation.oci-containers.containers = {
    actualbudget = {
      image = "ghcr.io/actualbudget/actual:26.4.0";
      autoStart = true;
      ports = [ "5006:5006/tcp" ];
      volumes = [
        "/var/lib/actualbudget:/data"
      ];
    };
  };

  # firewall for local access
  networking.firewall.allowedTCPPorts = [ 5006 ];
}
