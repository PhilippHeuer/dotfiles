{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.nodejs_23
    pkgs.yarn
  ];
}
