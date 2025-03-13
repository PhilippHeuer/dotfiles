{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

{
  environment.systemPackages = [
    pkgs.ungoogled-chromium
  ];
}
