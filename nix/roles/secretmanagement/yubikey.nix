{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.yubikey-manager
    pkgs.libfido2
  ];
}
