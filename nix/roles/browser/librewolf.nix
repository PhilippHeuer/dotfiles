{ pkgs, pkgs-unstable, lib, ... }:

{
  environment.systemPackages = [
    pkgs.librewolf
  ];

  programs.firejail.wrappedBinaries.librewolf = {
    executable = "${lib.getBin pkgs.librewolf}/bin/librewolf";
    profile = "${pkgs.firejail}/etc/firejail/librewolf.profile";
  };

  # set librewolf as the default browser
  #xdg.mime.defaultApplications = {
  #  "text/html" = "librewolf.desktop";
  #  "x-scheme-handler/http" = "librewolf.desktop";
  #  "x-scheme-handler/https" = "librewolf.desktop";
  #  "x-scheme-handler/about" = "librewolf.desktop";
  #  "x-scheme-handler/unknown" = "librewolf.desktop";
  #};

  # privacy settings
  # https://github.com/arkenfox/user.js/tree/master
}
