{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.syft
  ];
}
