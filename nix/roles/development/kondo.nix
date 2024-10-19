{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.kondo
  ];
}
