{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.nodejs_23
    pkgs.yarn
  ];
}
