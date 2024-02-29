{ config, pkgs, username, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

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
