{ pkgs, pkgs-unstable, pkgs-master, ... }:

{
  environment.systemPackages = [
    pkgs-master.alacritty
  ];
}
