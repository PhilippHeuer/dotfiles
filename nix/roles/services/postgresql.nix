{ pkgs, lib, ... }:

{
  # postgresql
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = pkgs.postgresql;
    extensions = [
      pkgs.postgresql17Packages.pgvector
    ];
    authentication = ''
      local all all trust
      host all all 0.0.0.0/0 scram-sha-256
      host all all ::/0 scram-sha-256
    '';
  };

  # firewall for local access
  networking.firewall.allowedTCPPorts = [ 5432 ];
}
