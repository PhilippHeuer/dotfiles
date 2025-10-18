{ pkgs, lib, inputs, ... }:

{
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  environment.systemPackages = [
    pkgs.sbctl
  ];

  # Lanzaboote currently replaces the systemd-boot module.
  boot.loader.systemd-boot.enable = lib.mkForce false;

  # Enable Lanzaboote
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
    settings = {
      beep = false;
      default = "auto-windows";
      timeout = 10;
      reboot-for-bitlocker = true;
      editor = true;
    };
  };
}
