{ pkgs, pkgs-unstable, inputs, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.dbeaver-bin
  ];
}
