{ pkgs, lib, ... }:

{
  environment.systemPackages = [
    pkgs.wireshark
  ];

  programs.firejail.wrappedBinaries.wireshark = {
    executable = "${lib.getBin pkgs.wireshark}/bin/wireshark";
    profile = "${pkgs.firejail}/etc/firejail/wireshark.profile";
  };
}
