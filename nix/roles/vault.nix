{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.vault
  ];
}
