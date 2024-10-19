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
    lsb-release # lsb_release
    gcc # c compiler
    psmisc # killall
    util-linux # umount
    moreutils # sponge, etc
    wayland-utils # for wayland-info
    cyme # lsusb replacement
    pciutils # pci devices
    jq # json parser
    libgcc # gcc compiler
    virt-what # virtualization detection

    nix-bash-completions # nix bash completions
    nix-index # nix-index and nix-locate
  ];
}
