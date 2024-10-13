{ pkgs, ... }:

{
  environment.systemPackages = [
    #pkgs.rustup
    pkgs.cargo
  ];
}
