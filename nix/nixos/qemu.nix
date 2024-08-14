{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.qemu
  ];

  boot.binfmt.emulatedSystems = [
    "wasm32-wasi"
    "aarch64-linux"
    #"alpha-linux"
    #"armv6l-linux"
    "armv7l-linux"
    #"powerpc-linux"
    #"powerpc64-linux"
    #"powerpc64le-linux"
    #"riscv32-linux"
    #"riscv64-linux"
    #"sparc-linux"
    #"sparc64-linux"
  ];
}
