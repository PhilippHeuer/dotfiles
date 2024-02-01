{ pkgs, username, ... }:

{
  environment.systemPackages = with pkgs; [
    appimage-run
  ];
}
