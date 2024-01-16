{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.wayland
    pkgs.xwayland
  ];
}
