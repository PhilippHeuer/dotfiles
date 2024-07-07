{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.nwg-panel
  ];
}
