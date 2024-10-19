{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.gramps
    pkgs.graphviz
  ];
}
