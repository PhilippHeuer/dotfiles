{
  pkgs,
  username,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../shared/gpu-default.nix
    ../shared/gpu-nvidia.nix
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

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Display configuration
  environment.etc = {
    "hyprland-display.conf" = {
      text = ''
                monitor=HDMI-A-1, 1920x1080@60, 0x0, 1
                monitor=DP-3, 3440x1440@99.98, 1920x0, 1

                workspace=11,monitor:HDMI-A-1
                workspace=1,monitor:DP-3
                workspace=2,monitor:DP-3
                workspace=3,monitor:DP-3
                workspace=4,monitor:DP-3
                workspace=5,monitor:DP-3
                workspace=6,monitor:DP-3
                workspace=7,monitor:DP-3
                workspace=8,monitor:DP-3
                workspace=9,monitor:DP-3
                workspace=10,monitor:DP-3

        	      exec-once=xrandr --output DP-3 --primary
      '';
    };
  };
}
