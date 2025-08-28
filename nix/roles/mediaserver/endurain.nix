{
  lib,
  config,
  ...
}:

let
  # renovate: datasource=docker depName=ghcr.io/joaovitoriasilva/endurain
  version = "v0.13.4";
in
{
  # systemd container service
  virtualisation.oci-containers.containers = {
    endurain = {
      image = "ghcr.io/joaovitoriasilva/endurain:" + version;
      autoStart = true;
      ports = [
        "8191:8080/tcp"
      ];
      volumes = [
        "/var/lib/endurain/data:/app/backend/data"
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
      };

    };
  };

  # firewall (8191 = endurain)
  networking.firewall.allowedTCPPorts = [ 8191 ];
}
