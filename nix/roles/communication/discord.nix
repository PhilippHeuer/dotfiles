{ pkgs, lib, ... }:

{
  environment.systemPackages = [
    pkgs.discord
  ];

  programs.firejail.wrappedBinaries.discord = {
    executable = "${lib.getBin pkgs.discord}/bin/discord";
    profile = "${pkgs.firejail}/etc/firejail/discord.profile";
  };
}
