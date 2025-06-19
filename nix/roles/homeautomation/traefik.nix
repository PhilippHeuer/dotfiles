{ pkgs, pkgs-unstable, ... }:

{
  services.traefik = {
    enable = true;

    staticConfigOptions = {
      entryPoints = {
        web = {
          address = ":80";
          asDefault = true;
          #http.redirections.entrypoint = {
          #  to = "websecure";
          #  scheme = "https";
          #};
        };

        websecure = {
          address = ":443";
          asDefault = true;
          #http.tls.certResolver = "letsencrypt";
        };
      };

      log = {
        level = "INFO";
        #filePath = "${config.services.traefik.dataDir}/traefik.log";
        format = "json";
      };

      #certificatesResolvers.letsencrypt.acme = {
      #  email = "postmaster@YOUR.DOMAIN";
      #  storage = "${config.services.traefik.dataDir}/acme.json";
      #  httpChallenge.entryPoint = "web";
      #};

      api.dashboard = true;
      api.insecure = true;
    };

    dynamicConfigOptions = {
      http.routers = {};
      http.services = {};
    };
  };

  services.traefik.dynamicConfigOptions.http.routers.traefikdashboard = {
    rule = "Host(`traefik.home`)";
    service = "traefikdashboard";
    entrypoints = [ "web" "websecure" ];
  };
  services.traefik.dynamicConfigOptions.http.services.traefikdashboard = {
    loadBalancer = {
      servers = [
        {
          url = "http://localhost:8080";
        }
      ];
    };
  };

  # firewall for entrypoints and dashboard
  networking.firewall.allowedTCPPorts = [ 80 443 8080 ];
}
