{ lib, pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    binutils
    tree
    file
    wget
    curl
    unzip
    nix-bash-completions
    psmisc # killall
  ];
}
