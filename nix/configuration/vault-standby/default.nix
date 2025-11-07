{
  pkgs,
  username,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration-new.nix
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

  # media directories
  services.paperless.mediaDir = "/mnt/ironwolf_zl22hc50/application-data/paperless-media";
  services.immich.mediaLocation = "/mnt/ironwolf_zl22hc50/application-data/immich-media";

  # endpoints
  services.traefik.dynamicConfigOptions.http.routers.traefikdashboard.rule = lib.mkForce "Host(`traefik.philippheuer.de`)";
  services.traefik.dynamicConfigOptions.http.routers.paperless.rule = lib.mkForce "Host(`paperless.philippheuer.de`)";
  services.traefik.dynamicConfigOptions.http.routers.jellyfin.rule = lib.mkForce "Host(`jellyfin.philippheuer.de`)";
  services.traefik.dynamicConfigOptions.http.routers.plex.rule = lib.mkForce "Host(`plex.philippheuer.de`)";
  services.traefik.dynamicConfigOptions.http.routers.immich.rule = lib.mkForce "Host(`immich.philippheuer.de`)";
  services.traefik.dynamicConfigOptions.http.routers.audiobookshelf.rule = lib.mkForce "Host(`audiobookshelf.philippheuer.de`)";
  services.traefik.dynamicConfigOptions.http.routers.komga.rule = lib.mkForce "Host(`komga.philippheuer.de`)";
  services.traefik.dynamicConfigOptions.http.routers.endurain.rule = lib.mkForce "Host(`endurain.philippheuer.de`)";
}
