{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

{
  environment.systemPackages = [
    pkgs.floorp-bin
  ];
}
