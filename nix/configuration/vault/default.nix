{ config, pkgs, username, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # hardware acceleration
  hardware.opengl = {
    driSupport32Bit = true;
    extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau intel-ocl ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva vaapiIntel libvdpau-va-gl vaapiVdpau ];
  };

  # shell
  users.defaultUserShell = pkgs.bash;

  # hostname
  networking.hostName = "phx-vault";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.scanRandMacAddress = false; # causes issues with some wifi networks

  # secrets
  sops.age.keyFile = lib.mkForce "/home/${username}/.config/sops/age/keys.txt";
}
