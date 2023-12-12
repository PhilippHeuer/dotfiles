{ pkgs, username, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
  ];
}
