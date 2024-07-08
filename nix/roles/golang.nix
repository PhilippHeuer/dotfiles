{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.go
    pkgs-unstable.gotools
  ];
}
