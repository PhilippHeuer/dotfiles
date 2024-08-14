{ pkgs, lib, ... }:

{
  # Enable x11
  services.xserver.enable = true;

  # Enable KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;

  # SDDM default environment
  services.displayManager.defaultSession = lib.mkDefault "plasma.desktop";
}
