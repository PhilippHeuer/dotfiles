{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.ghidra
  ];

  programs.firejail.wrappedBinaries.ghidra = {
    executable = "${lib.getBin pkgs.ghidra}/bin/ghidra";
    profile = "${pkgs.firejail}/etc/firejail/ghidra.profile";
  };
}
