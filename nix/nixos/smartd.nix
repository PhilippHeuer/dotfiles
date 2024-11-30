{
  pkgs,
  config,
  lib,
  ...
}:

{
  # secrets
  sops.secrets."notify/email/server" = lib.mkDefault { };
  sops.secrets."notify/email/username" = lib.mkDefault { };
  sops.secrets."notify/email/password" = lib.mkDefault { };
  sops.secrets."notify/email/to" = lib.mkDefault { };

  sops.templates."smartd-notification.sh".content = ''
    # log message
    echo SMARTD_FULLMESSAGE=$SMARTD_FULLMESSAGE >> /var/log/smartd.log

    # load secrets
    SMTP_SERVER=$(${pkgs.coreutils}/bin/cat ${config.sops.secrets."notify/email/server".path})
    SMTP_USER=$(${pkgs.coreutils}/bin/cat ${config.sops.secrets."notify/email/username".path})
    SMTP_PASS=$(${pkgs.coreutils}/bin/cat ${config.sops.secrets."notify/email/password".path})
    SMTP_TO=$(${pkgs.coreutils}/bin/cat ${config.sops.secrets."notify/email/to".path})

    # mail notification
    echo -e "Subject: SMART Notification\n\n$SMARTD_FULLMESSAGE" | ${pkgs.msmtp}/bin/msmtp --debug \
      --host="$SMTP_SERVER" \
      --port=587 \
      --auth=on \
      --tls=on \
      --tls-starttls \
      --user="$SMTP_USER" \
      --passwordeval="${pkgs.coreutils}/bin/cat ${config.sops.secrets."notify/email/password".path}" \
      --from="$SMTP_USER" \
      "$SMTP_TO"
  '';
  sops.templates."smartd-notification.sh".mode = "0777";

  # package dependencies
  environment.systemPackages = [
    pkgs.smartmontools # smartd
    pkgs.msmtp # smtp client
  ];

  # smartd service configuration
  services.smartd = {
    enable = true;
    autodetect = true; # monitor all devices connected when the machine is booted
    # See smartd.conf(5) man page for details about these options:
    # "-a": enable all checks
    # "-o VALUE": enable/disable automatic offline testing on device (on/off)
    # "-s REGEXP": do a short test every day at 3am and a long test every sunday at 3am.
    # "-M exec COMMAND": execute COMMAND when smartd detects a problem
    defaults.autodetected = "-a -o on -s (S/../.././03|L/../../7/03) -M exec ${
      config.sops.templates."smartd-notification.sh".path
    }";

    notifications = {
      test = false;
    };
  };
}
