{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.mpv
    pkgs-unstable.mpvScripts.thumbfast
    pkgs-unstable.mpvScripts.sponsorblock
  ];
}
