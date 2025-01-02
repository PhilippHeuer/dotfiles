{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.oras
  ];
}
