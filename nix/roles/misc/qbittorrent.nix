{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.qbittorrent
  ];
}
