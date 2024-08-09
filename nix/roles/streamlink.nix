{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.streamlink
  ];
}
