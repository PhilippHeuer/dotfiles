{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.termshark
  ];
}
