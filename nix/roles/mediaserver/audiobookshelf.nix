{ pkgs, lib, ... }:

{
  services.audiobookshelf = {
    package = pkgs.audiobookshelf;
    enable = true;
    dataDir = "audiobookshelf"; # path relative to /var/lib
  };

  services.traefik.dynamicConfigOptions.http.routers.audiobookshelf = {
    rule = lib.mkDefault "Host(`audiobookshelf.home`)";
    service = "audiobookshelf";
    entrypoints = [ "web" "websecure" ];
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
}
