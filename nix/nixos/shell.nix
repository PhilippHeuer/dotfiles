{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.bash
    pkgs.zsh
  ];
}
