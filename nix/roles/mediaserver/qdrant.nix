{ pkgs, lib, ... }:

{
  # systemd container
  virtualisation.oci-containers.containers = {
    qdrant = {
      image = "docker.io/qdrant/qdrant:v1.15-unprivileged";
      autoStart = true;
      ports = [ "6333:6333/tcp" "6334:6334/tcp" ];
      volumes = [
        "/var/lib/qdrant:/qdrant/storage"
      ];
    };
  };

  # firewall for local access
  networking.firewall.allowedTCPPorts = [ 6333 6334 ];
}
