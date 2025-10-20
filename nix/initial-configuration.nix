# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    enable = false;
    layout = "de";
    xkbVariant = "nodeadkeys";
    displayManager.gdm.enable = false;
    desktopManager.plasma6.enable = false;
  };

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # Configure console keymap
  console.keyMap = "de-latin1-nodeadkeys";

  # user account
  users.users.phx = {
    isNormalUser = true;
    description = "philipp";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];

    # ssh keys
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIAbhI9hxpDxO8QQ4mrGeAvyypyarZ6SQwb6Is+Iz3uJ phx"
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAICp00GP8aMaxCWgvthbDcqHMWcAwEwzgOcoatLqqaThdAAAAC3NzaDpwcmltYXJ5 phx-sk1"
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIKOf6dQuq5reydB8gcuHIGWY3TP1MlSCyL0JELuvu9gwAAAAC3NzaDpwcmltYXJ5 phx-sk2"
    ];
  };

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # system packages
  environment.systemPackages = with pkgs; [
    neovim
    curl
  ];

  # sshd server
  services.openssh = {
    enable = true;

    settings = {
      # require public key authentication for better security
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;

      # disable root login
      PermitRootLogin = "no";

      # limit the number of authentication attempts
      MaxAuthTries = 10;
    };
  };

  system.stateVersion = "25.05";
}
