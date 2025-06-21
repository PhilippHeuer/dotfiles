{
  pkgs,
  username,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # hardware acceleration
  hardware.graphics.enable32Bit = true;
  hardware.graphics.extraPackages = with pkgs; [
    vaapiIntel
    libvdpau-va-gl
    vaapiVdpau
    intel-ocl
    intel-compute-runtime # OpenCL filter support (hardware tonemapping and subtitle burn-in)
    intel-media-driver
    intel-vaapi-driver
    vpl-gpu-rt # QSV on 11th gen or newer
  ];
  hardware.graphics.extraPackages32 = with pkgs.pkgsi686Linux; [
    libva
    vaapiIntel
    libvdpau-va-gl
    vaapiVdpau
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  # shell
  users.defaultUserShell = pkgs.bash;

  # hostname
  networking.hostName = "vault";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.scanRandMacAddress = false; # causes issues with some wifi networks

  # secrets
  sops.age.keyFile = lib.mkForce "/home/${username}/.config/sops/age/keys.txt";

  # paperless media directory
  services.paperless.mediaDir = "/mnt/ironwolf_zl22hc50/application-data/paperless-media";
}
