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
              href = "https://nextcloud.${domain}";
              icon = "nextcloud";
            };
          }
          {
            Paperless = {
              href = "https://paperless.${domain}";
              icon = "paperless";
            };
          }
          {
            Miniflux = {
              href = "https://rss.${domain}";
              icon = "miniflux";
            };
          }
          {
            Immich = {
              href = "https://immich.${domain}";
              icon = "immich";
            };
          }
        ];
      }
      {
        Utilities = [
          {
            Traefik = {
              href = "https://traefik.${domain}";
              icon = "traefik";
            };
          }
          {
            Blocky = {
              href = "https://blocky.${domain}";
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
              href = "https://jellyfin.${domain}";
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
