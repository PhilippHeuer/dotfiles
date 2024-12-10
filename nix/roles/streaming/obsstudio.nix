{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.obs-studio
    pkgs.obs-cmd
  ];
}
