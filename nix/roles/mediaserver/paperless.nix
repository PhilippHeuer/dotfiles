{ pkgs, ... }:

{
  # admin user is created with sudo paperless-manage createsuperuser
  services.paperless = {
    enable = true;
    consumptionDirIsPublic = true;
    settings = {
      PAPERLESS_CONSUMER_IGNORE_PATTERN = [
        ".DS_STORE/*"
        "desktop.ini"
      ];
      PAPERLESS_OCR_LANGUAGE = "deu+eng";
      PAPERLESS_OCR_USER_ARGS = {
        optimize = 1;
        pdfa_image_compression = "lossless";
      };
      #PAPERLESS_URL = "https://paperless.example.com";
    };
  };

  services.traefik.dynamicConfigOptions.http.routers.paperless = {
    rule = "Host(`paperless.home`)";
    service = "paperless";
    entrypoints = [ "web" "websecure" ];
  };
  services.traefik.dynamicConfigOptions.http.services.paperless = {
    loadBalancer = {
      servers = [
        {
          url = "http://localhost:28981";
        }
      ];
    };
  };
}
