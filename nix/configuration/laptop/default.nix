{ config, pkgs, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../shared/gpu-default.nix
    ../shared/gpu-nvidia.nix
  ];

  # shell
  users.defaultUserShell = pkgs.bash;

  # hostname
  networking.hostName = "phx-laptop";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.scanRandMacAddress = false; # causes issues with some wifi networks

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
}
