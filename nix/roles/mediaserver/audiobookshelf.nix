{ pkgs, ... }:

{
  services.audiobookshelf = {
    package = pkgs.audiobookshelf;
    enable = true;
    dataDir = "audiobookshelf"; # path relative to /var/lib
  };

  services.traefik.dynamicConfigOptions.http.routers.audiobookshelf = {
    rule = "Host(`audiobookshelf.home`)";
    service = "audiobookshelf";
    entrypoints = [ "web" ];
  };
  services.traefik.dynamicConfigOptions.http.services.audiobookshelf = {
    loadBalancer = {
      servers = [
        {
          url = "http://localhost:8000";
        }
      ];
    };
  };

  # firewall (8000 = audiobookshelf web interface)
  networking.firewall.allowedTCPPorts = [ 8000 ];
}
