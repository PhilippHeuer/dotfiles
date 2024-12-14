{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.bash
    pkgs.bash-completion
  ];
}
