{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.qbittorrent
  ];
}
