{ pkgs, ... }:

{
  services.homepage-dashboard = {
    enable = true;
    settings = {
      title = "Homelab";
    };
    services = [
      {
        Services = [
          {
            Nextcloud = {
              href = "https://nextcloud.home";
              icon = "nextcloud";
            };
          }
          {
            Paperless = {
              href = "https://paperless.home";
              icon = "paperless";
            };
          }
          {
            Miniflux = {
              href = "https://rss.home";
              icon = "miniflux";
            };
          }
          {
            Immich = {
              href = "https://immich.home";
              icon = "immich";
            };
          }
        ];
      }
      {
        Utilities = [
          {
            Traefik = {
              href = "https://traefik.home";
              icon = "traefik";
            };
          }
          {
            Blocky = {
              href = "https://blocky.home";
              icon = "blocky";
            };
          }
        ];
      }
      {
        Multimedia = [
          {
            Jellyfin = {
              icon = "jellyfin";
              href = "https://jellyfin.home";
            };
          }
        ];
      }
    ];
    bookmarks = [
      {
        Developer = [
          {
            Github = [{
              icon = "si-github";
              href = "https://github.com/";
            }];
          }
          {
            "Nixos Search" = [{
              icon = "si-nixos";
              href = "https://search.nixos.org/packages";
            }];
          }
          {
            "Nixos Wiki" = [{
              icon = "si-nixos";
              href = "https://nixos.wiki/";
            }];
          }
          {
            "Kubernetes Docs" = [{
              icon = "si-kubernetes";
              href = "https://kubernetes.io/docs/home/";
            }];
          }
        ];
      }
    ];
  };
}
