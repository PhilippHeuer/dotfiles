{ pkgs, ... }:

let
  # renovate: datasource=docker depName=ghcr.io/berriai/litellm
  version = "1.90.3";
in
{
  # systemd container service
  virtualisation.oci-containers.containers = {
    litellm = {
      image = "ghcr.io/berriai/litellm:" + version;
      autoStart = true;
      ports = [
        "4000:4000/tcp"
      ];
      volumes = [ "/var/lib/litellm/config.yaml:/app/config.yaml" ];
      environment = {
        STORE_MODEL_IN_DB = "True";
      };
      cmd = [ "--config" "/app/config.yaml" ];
    };
  };

  # firewall (4000 = litellm ui)
  networking.firewall.allowedTCPPorts = [ 4000 4001 4002 ];
}
