{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.go
    pkgs.gotools
  ];
}
