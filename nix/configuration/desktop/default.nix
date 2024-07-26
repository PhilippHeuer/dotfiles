{
  pkgs,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../shared/graphics.nix
    #../shared/nvidia.nix
  ];

  # bootloader
  boot.loader.systemd-boot.enable = true;

  # bootloader
  #boot.loader.grub = {
  #  enable = true;
  #  device = "/dev/sda";
  #  useOSProber = true;
  #  efiSupport = true;
  #};
  #boot.loader.systemd-boot = {
  #  enable = false;
  #};
  boot.loader.efi.canTouchEfiVariables = true;

  # shell
  users.defaultUserShell = pkgs.bash;

  # hostname
  networking.hostName = "phx-desktop";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "de";
      variant = "nodeadkeys";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
