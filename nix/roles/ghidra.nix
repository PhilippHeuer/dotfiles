{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.ghidra
  ];
}
