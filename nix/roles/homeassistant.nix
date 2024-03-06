{ pkgs, ... }:

{
  # systemd container service
  virtualisation.oci-containers.containers = {
    home-assistant = {
      image = "homeassistant/home-assistant:2023.12.4";
      autoStart = true;
      ports = [
        "8123:8123/tcp"
      ];
      volumes = [ "/var/lib/hass:/config" ];
    };
  };
}
