{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

{
  environment.systemPackages = [
    pkgs.jellyfin-media-player
  ];
}
