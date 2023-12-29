{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    yubikey-manager
    libfido2
  ];
}
