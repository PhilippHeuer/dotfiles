{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.zed-editor
  ];
}
