{ pkgs, lib, ... }:

{
  # systemd container
  virtualisation.oci-containers.containers = {
    pgvector = {
      image = "docker.io/pgvector/pgvector:0.8.0-pg17";
      autoStart = true;
      ports = [ "5432:5432/tcp" ];
      environment = {
        POSTGRES_PASSWORD = "postgres";
      };
      volumes = [
        "/var/lib/pgvector:/var/lib/postgresql/data"
      ];
    };
  };

  # firewall for local access
  networking.firewall.allowedTCPPorts = [ 5432 ];
}
