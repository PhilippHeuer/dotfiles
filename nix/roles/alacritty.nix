{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.alacritty
  ];
}
