{ pkgs, lib, ... }:

{
  # systemd container
  virtualisation.oci-containers.containers = {
    openwebui = {
      image = "ghcr.io/open-webui/open-webui:v0.6.22";
      autoStart = true;
      ports = [ "3000:8080/tcp" ];
      volumes = [
        "/var/lib/openwebui:/app/backend/data"
      ];
    };
  };

  # firewall for local access
  networking.firewall.allowedTCPPorts = [ 3000 ];
}
