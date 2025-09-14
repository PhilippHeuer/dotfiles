{
  config,
  pkgs,
  username,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../shared/gpu-default.nix
  ];

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 10; # wait 10 seconds before the default item is booted
  #boot.loader.systemd-boot.edk2-uefi-shell.enable = true;

  # dual-boot
  boot.loader.systemd-boot.windows = {
    "win11" = {
      title = "Windows 11";
      efiDeviceHandle = "HD0c";
      sortKey = "o_windows_11";
    };
  };

  # shell
  users.defaultUserShell = pkgs.bash;

  # hostname
  networking.hostName = "phx-laptop";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.scanRandMacAddress = false; # causes issues with some wifi networks

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
}
