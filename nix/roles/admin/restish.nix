{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.restish
  ];
}
