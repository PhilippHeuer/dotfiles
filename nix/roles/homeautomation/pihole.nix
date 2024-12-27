{ pkgs, pkgs-unstable, ... }:

let
  # renovate: datasource=docker depName=docker.io/pihole/pihole
  version = "2024.07.0";
in
{
  # systemd container service
  virtualisation.oci-containers.containers = {
    pihole = {
      image = "docker.io/pihole/pihole:" + version;
      autoStart = true;
      ports = [
        "53:53/tcp"
        "53:53/udp"
        "67:67/udp"
        "9010:80/tcp"
      ];
      volumes = [
        "/var/lib/pihole/config:/etc/pihole"
        "/var/lib/pihole/dnsmasq:/etc/dnsmasq.d"
      ];
      environment = {
        TZ = "Europe/Berlin";
        VIRTUAL_HOST = "0.0.0.0:9010";
        #WEBPASSWORD = "";
      };
      extraOptions = [ "--dns=1.1.1.1" ];
    };
  };

  # firewall
  networking.firewall.allowedTCPPorts = [ 53 9010 ];
  networking.firewall.allowedUDPPorts = [ 53 67 ];
}
