{ pkgs, lib, ... }:

{
  # systemd container
  virtualisation.oci-containers.containers = {
    neo4j = {
      image = "docker.io/library/neo4j:2026.03.1-community";
      autoStart = true;
      ports = [ "7474:7474/tcp" "7687:7687/tcp" ];
      volumes = [
        "/var/lib/neo4j:/data"
      ];
      environment = {
        NEO4J_dbms_usage__report_enabled = "false";
        NEO4J_apoc_export_file_enabled = "true";
        NEO4J_apoc_import_file_enabled = "true";
        NEO4J_apoc_import_file_use__neo4j__config = "true";
        NEO4J_PLUGINS = "[\"apoc\"]";
      };
    };
  };

  # firewall for local access
  networking.firewall.allowedTCPPorts = [ 7474 7687 ];
}
