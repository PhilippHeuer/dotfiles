{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.libfaketime
  ];
}
