{ pkgs, ... }:


let
  # renovate: datasource=docker depName=docker.io/homeassistant/home-assistant
  version = "2024.11.3";
in {
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
}
