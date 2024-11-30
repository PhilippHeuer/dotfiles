{ pkgs, lib, ... }:

{
  environment.systemPackages = [
    pkgs.termshark
  ];

  programs.firejail.wrappedBinaries.termshark = {
    executable = "${lib.getBin pkgs.termshark}/bin/termshark";
    profile = "${pkgs.firejail}/etc/firejail/tshark.profile";
  };
}
