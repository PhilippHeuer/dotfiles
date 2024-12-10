{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

{
  environment.systemPackages = [
    pkgs.mpv
    pkgs-unstable.mpvScripts.thumbfast
    pkgs-unstable.mpvScripts.sponsorblock
  ];

  programs.firejail.wrappedBinaries.mpv = {
    executable = "${lib.getBin pkgs.mpv}/bin/mpv";
    profile = "${pkgs.firejail}/etc/firejail/mpv.profile";
  };
}
