{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.sshfs
  ];
}
