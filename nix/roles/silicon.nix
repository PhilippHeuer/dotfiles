{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.silicon
  ];
}
