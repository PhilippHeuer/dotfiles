{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.veracrypt
  ];

  # veracrypt group for volume access
  users.groups.veracrypt-volume = {};

  # auto disamount all volumes on shutdown
  systemd.services.veracrypt-shutdown = {
    description = "Disamount all veracrypt volumes on shutdown";
    before = [
      "shutdown.target"
      "reboot.target"
      "halt.target"
    ];
    wantedBy = [
      "shutdown.target"
      "reboot.target"
      "halt.target"
    ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.veracrypt}/bin/veracrypt -d";
    };
  };
}
