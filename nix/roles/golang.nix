{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.go_1_23
    pkgs.gotools
  ];
}
