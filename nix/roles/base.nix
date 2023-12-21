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
    util-linux # umount
    nix-index # nix-index and nix-locate
  ];
}
