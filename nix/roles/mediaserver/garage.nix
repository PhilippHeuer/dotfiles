{
  lib,
  config,
  ...
}:

let
  # renovate: datasource=docker depName=docker.io/dxflrs/garage
  version = "2.1.0";
in
{
  # systemd container service
  virtualisation.oci-containers.containers = {
    garage = {
      image = "docker.io/dxflrs/garage:v" + version;
      autoStart = true;
      ports = [
        "3900:3900/tcp"
        "3901:3901/tcp"
        "3902:3902/tcp"
        "3903:3903/tcp"
      ];
      volumes = [
        "/var/lib/garage/garage.toml:/etc/garage.toml"
        "/var/lib/garage/meta:/var/lib/garage/meta"
        "/var/lib/garage/data:/var/lib/garage/data"
      ];
      environment = {};
    };
  };

  services.traefik.dynamicConfigOptions.http.routers.garage = {
    rule = lib.mkDefault "Host(`garage.home`)";
    service = "garage";
    entrypoints = [ "web" "websecure" ];
  };
  services.traefik.dynamicConfigOptions.http.services.garage = {
    loadBalancer = {
      servers = [
        {
          url = "http://localhost:3900";
        }
      ];
    };
  };
}
