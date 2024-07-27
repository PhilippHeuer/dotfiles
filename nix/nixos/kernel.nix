{ lib, pkgs, config, ... }:

{
  boot = {
    # enable in-memory /tmp
    # tmp.useTmpfs = true;
    tmp.cleanOnBoot = !config.boot.tmp.useTmpfs;

    # supported filesystems
    supportedFilesystems = ["ntfs"];

    # kernel parameters
    kernelParams = lib.optionals config.boot.initrd.systemd.enable ["systemd.show_status=false"];

    # kernel packages
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

    # initrd systemd
    initrd.systemd.enable = lib.mkDefault true;
  };

  # enable in-memory compression and swap by zram kernel module
  zramSwap.enable = lib.mkDefault true;

  # enable firmware
  # hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;

  # update AMD microcode
  hardware.cpu.amd.updateMicrocode = true;

  environment.systemPackages = with pkgs; [
    policycoreutils # SELinux
  ];
}
