{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.blesh
    pkgs-unstable.atuin
  ];
}
