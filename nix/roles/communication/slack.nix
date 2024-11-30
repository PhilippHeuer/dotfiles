{ pkgs, lib, ... }:

{
  environment.systemPackages = [
    pkgs.slack
  ];

  programs.firejail.wrappedBinaries.slack = {
    executable = "${lib.getBin pkgs.slack}/bin/slack";
    profile = "${pkgs.firejail}/etc/firejail/slack.profile";
  };
}
