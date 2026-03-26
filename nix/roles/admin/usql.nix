{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.usql
  ];
}
