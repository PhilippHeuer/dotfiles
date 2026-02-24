{ pkgs, lib, ... }:

{
  # systemd container
  virtualisation.oci-containers.containers = {
    openwebui = {
      image = "ghcr.io/open-webui/open-webui:v0.8.5";
      autoStart = true;
      ports = [ "3000:8080/tcp" ];
      volumes = [
        "/var/lib/openwebui:/app/backend/data"
      ];
      environment = {
        ENABLE_VERSION_UPDATE_CHECK = "false";
        ENABLE_FORWARD_USER_INFO_HEADERS = "true";
        ENABLE_API_KEYS = "true";
      };
    };
  };

  # firewall for local access
  networking.firewall.allowedTCPPorts = [ 3000 ];
}
