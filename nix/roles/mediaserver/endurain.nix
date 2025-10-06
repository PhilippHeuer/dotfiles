{
  lib,
  config,
  ...
}:

let
  # renovate: datasource=docker depName=ghcr.io/joaovitoriasilva/endurain
  version = "0.15.0";
in
{
  # systemd container service
  virtualisation.oci-containers.containers = {
    endurain = {
      image = "ghcr.io/joaovitoriasilva/endurain:v" + version;
      autoStart = true;
      ports = [
        "8191:8080/tcp"
      ];
      volumes = [
        "/var/lib/endurain/data:/app/backend/data"
        "/var/lib/endurain/logs:/app/backend/logs"
      ];
      environment = {
        TZ = "Europe/Berlin";
        SECRET_KEY = "ecd11374572e2cf9edc622f300c7674e79110856d1fc16ca2d112aa7f72dfdbf";
        FERNET_KEY = "AcTrcV_sFc3SbFz_qaA2AyVr64HOmfaykNyCxAIrsmc=";
        DB_TYPE = "postgres";
        DB_HOST = "10.98.0.55";
        DB_PORT = "5432";
        DB_USER = "endurain";
        DB_PASSWORD = "endurain";
        ENDURAIN_HOST = "http://endurain.philippheuer.de";
      };

    };
  };

  services.traefik.dynamicConfigOptions.http.routers.endurain = {
    rule = lib.mkDefault "Host(`endurain.home`)";
    service = "endurain";
    entrypoints = [ "web" "websecure" ];
  };
  services.traefik.dynamicConfigOptions.http.services.endurain = {
    loadBalancer = {
      servers = [
        {
          url = "http://localhost:8191";
        }
      ];
    };
  };
}
