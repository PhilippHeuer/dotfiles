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
  };

  # firewall for local access
  networking.firewall.allowedTCPPorts = [ 5432 ];
}
