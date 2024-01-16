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
    lsb-release # lsb_release
    gcc # c compiler
    psmisc # killall
    util-linux # umount
    moreutils # sponge, etc
    nix-index # nix-index and nix-locate
    cyme # lsusb replacement
    pciutils # pci devices
  ];
}
