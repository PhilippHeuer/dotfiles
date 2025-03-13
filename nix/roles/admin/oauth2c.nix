{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:

{
  environment.systemPackages = [
    pkgs-unstable.oauth2c
  ];
}
