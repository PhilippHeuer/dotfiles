{ lib, pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    binutils
    tree
    file
    wget
    curl
    unzip
    gnupg
    nix-bash-completions
    gcc # c compiler
    psmisc # killall
    util-linux # umount
    nix-index # nix-index and nix-locate
    cyme # lsusb replacement
    pciutils # pci devices
  ];
}
