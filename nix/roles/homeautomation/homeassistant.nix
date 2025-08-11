{ pkgs, ... }:

let
  # renovate: datasource=docker depName=docker.io/homeassistant/home-assistant
  version = "2025.8.1";
in
{
  # systemd container service
  virtualisation.oci-containers.containers = {
    home-assistant = {
      image = "docker.io/homeassistant/home-assistant:" + version;
      autoStart = true;
      ports = [
        "8123:8123/tcp"
      ];
      volumes = [ "/var/lib/hass:/config" ];
    };
  };

  # firewall (8123 = home-assistant ui)
  networking.firewall.allowedTCPPorts = [ 8123 ];
}
