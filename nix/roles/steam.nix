{ pkgs, ... }:

{
  # steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  # packages
  environment.systemPackages = with pkgs; [
    steam
  ];
}
