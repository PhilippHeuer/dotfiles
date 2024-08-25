{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.ags
  ];
}
