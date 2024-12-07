{ pkgs, pkgs-unstable, ... }:

{
  # allows to make mounts available to other users
  programs.fuse.userAllowOther = true;

  environment.systemPackages = [
    pkgs.sshfs
  ];
}
