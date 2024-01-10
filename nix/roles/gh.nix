{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.gh
  ];
}
