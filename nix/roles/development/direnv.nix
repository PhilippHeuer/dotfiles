{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.direnv
  ];
}
