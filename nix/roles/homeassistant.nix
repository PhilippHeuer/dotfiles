{ pkgs, ... }:

{
  # systemd container service
  virtualisation.oci-containers.containers = {
    home-assistant = {
      # renovate: datasource=docker depName=docker.io/homeassistant/home-assistant
      image = "docker.io/homeassistant/home-assistant:2024.4.1";
      autoStart = true;
      ports = [
        "8123:8123/tcp"
      ];
      volumes = [ "/var/lib/hass:/config" ];
    };
  };
}
