{ pkgs, pkgs-unstable, inputs, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.vault # cli
  ];
}
