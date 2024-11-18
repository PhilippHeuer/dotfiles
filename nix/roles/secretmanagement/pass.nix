{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.pass-wayland
  ];
}
