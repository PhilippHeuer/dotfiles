{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.foot
  ];
}
