{ pkgs, lib, ... }:

{
  # systemd container
  virtualisation.oci-containers.containers = {
    neo4j = {
      image = "docker.io/library/neo4j:2026.02.2-community-trixie";
      autoStart = true;
      ports = [ "7474:7474/tcp" "7687:7687/tcp" ];
      volumes = [
        "/var/lib/neo4j:/data"
      ];
      environment = {
        NEO4J_dbms_usage__report_enabled = "false";
      };
    };
  };

  # firewall for local access
  networking.firewall.allowedTCPPorts = [ 7474 7687 ];
}
