{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.librewolf
  ];

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
