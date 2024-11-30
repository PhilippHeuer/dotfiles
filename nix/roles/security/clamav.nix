{ pkgs, ... }:

{
  # scan commands
  # vulnix --system
  # sudo freshclam; clamscan [options] [file/directory/-]
  environment.systemPackages = [
    pkgs.vulnix
    pkgs.clamav
  ];

  # enable clamav service (daemon and updater)
  services.clamav = {
    # daemon
    daemon.enable = true;

    # updater
    updater.enable = true;
    updater.interval = "daily";
    updater.frequency = 12;

    # fangfrisch updates and verifies unofficial clamav signatures
    fangfrisch.enable = true;
    fangfrisch.interval = "daily";
  };
}
