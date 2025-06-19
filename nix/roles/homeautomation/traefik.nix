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
    };

    dynamicConfigOptions = {
      http.routers = {};
      http.services = {};
    };
  };

  # firewall for entrypoints
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
