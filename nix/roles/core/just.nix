{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.just
  ];
}
