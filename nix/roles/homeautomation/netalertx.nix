{
  lib,
  config,
  ...
}:

# link: https://github.com/jokob-sk/NetAlertX
let
  # renovate: datasource=docker depName=docker.io/jokobsk/netalertx
  version = "26.2.6";
in
{
  # secrets
  sops.secrets."notify/email/server" = lib.mkDefault {
    restartUnits = [ "podman-netalertx.service" ];
  };
  sops.secrets."notify/email/username" = lib.mkDefault {
    restartUnits = [ "podman-netalertx.service" ];
  };
  sops.secrets."notify/email/password" = lib.mkDefault {
    restartUnits = [ "podman-netalertx.service" ];
  };
  sops.secrets."netalert/email/to" = lib.mkDefault {
    restartUnits = [ "podman-netalertx.service" ];
  };
  sops.secrets."netalert/subnet" = lib.mkDefault {
    restartUnits = [ "podman-netalertx.service" ];
  };
  sops.secrets."netalert/password" = lib.mkDefault {
    restartUnits = [ "podman-netalertx.service" ];
  };

  sops.templates."netalertx-config.env" = {
    content = ''
      APP_CONF_OVERRIDE={"UI_theme":"Dark","LOADED_PLUGINS":["ARPSCAN","DBCLNP","MAINT","NSLOOKUP","NTFPRCS","AVAHISCAN","SETPWD","SMTP","SYNC","VNDRPDT","WORKFLOWS","UI","NMAP"],"DAYS_TO_KEEP_EVENTS":7,"WORKFLOWS_AppEvents_hist":1000,"NTFPRCS_INCLUDED_SECTIONS":["new_devices","down_devices"],"NTFPRCS_alert_down_time":5,"SCAN_SUBNETS":"${
        config.sops.placeholder."netalert/subnet"
      }","SMTP_RUN":"on_notification","SMTP_SERVER":"${config.sops.placeholder."notify/email/server"}","SMTP_USER":"${config.sops.placeholder."notify/email/username"}","SMTP_PASS":"${
        config.sops.placeholder."notify/email/password"
      }","SMTP_REPORT_TO":"${config.sops.placeholder."netalert/email/to"}","SMTP_REPORT_FROM":"NetAlertX <${
        config.sops.placeholder."notify/email/username"
      }>","SETPWD_enable_password":"True","SETPWD_password":"${config.sops.placeholder."netalert/password"}"}
    '';
  };

  # systemd container service
  virtualisation.oci-containers.containers = {
    netalertx = {
      image = "docker.io/jokobsk/netalertx:" + version;
      autoStart = true;
      volumes = [
        "/var/lib/netalertx/config:/app/config"
        "/var/lib/netalertx/db:/app/db"
      ];
      environment = {
        TZ = "Europe/Berlin";
        LISTEN_ADDR = "0.0.0.0";
        PORT = "20211";
      };
      environmentFiles = [ config.sops.templates."netalertx-config.env".path ];
      extraOptions = [
        "--network=host"
        "--cap-add=NET_RAW" # NET_RAW is required for ARP scanning
      ];
    };
  };

  # firewall (20211 = netalertx ui)
  networking.firewall.allowedTCPPorts = [ 20211 ];
}
