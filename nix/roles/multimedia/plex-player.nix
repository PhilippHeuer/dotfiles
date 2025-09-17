{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

{
  environment.systemPackages = [
    pkgs.plex-desktop
  ];
}
