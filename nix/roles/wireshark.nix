{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.wireshark
  ];
}
