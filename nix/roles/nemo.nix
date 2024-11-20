{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.nemo
  ];
}
