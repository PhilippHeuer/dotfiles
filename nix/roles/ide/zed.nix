{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.zed-editor
  ];
}
