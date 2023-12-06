{
  lib,
  pkgs,
  config,
  ...
}: {
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  boot = {
    plymouth.enable = true;
    # tmp.useTmpfs = true;
    tmp.cleanOnBoot = !config.boot.tmp.useTmpfs;
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    supportedFilesystems = ["ntfs"];
    initrd.systemd.enable = lib.mkDefault true;
    # Silent boot when `initrd.systemd` enable
    kernelParams = lib.optionals config.boot.initrd.systemd.enable ["systemd.show_status=false"];
  };

  # enable in-memory compression and swap by zram kernel module
  zramSwap.enable = lib.mkDefault true;

  # gpg agent
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # enable redistributable firmware
  hardware.enableRedistributableFirmware = true;
  # hardware.enableAllFirmware = true;

  # increase open file limit for sudoers
  security.pam.loginLimits = [
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];
}
