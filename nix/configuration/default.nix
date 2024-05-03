{
  inputs,
  outputs,
  self,
}: let
  nixosRoles = import ../roles;

  # utility function to create a configuration
  mkConfiguration = {
    username,
    system ? "x86_64-linux",
    defaultModules ? true,
    extraModules ? [],
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs outputs self username system;
        pkgs-unstable = import inputs.nixpkgs-unstable {
          system = system;
          config.allowUnfree = true;
        };
        pkgs-master = import inputs.nixpkgs-master {
          system = system;
          config.allowUnfree = true;
        };
      };
      modules =
        inputs.nixpkgs.lib.optionals defaultModules [
          self.nixosModules.default
        ]
        ++ extraModules;
    };

in {
  # desktop
  desktop = mkConfiguration {
    username = "phx";
    extraModules = [
      # nixos
      ../nixos/bootloader.nix
      ../nixos/kernel.nix
      ../nixos/security.nix
      ../nixos/user.nix
      ../nixos/audio.nix
      ../nixos/virtualization.nix
      ../nixos/qemu.nix
      ../nixos/ssh.nix
      ../nixos/cacerts.nix
      ../nixos/proxy.nix
      ../nixos/flatpak.nix
      # roles
      nixosRoles.default
      nixosRoles.development
      nixosRoles.language-toolchains
      nixosRoles.desktop
      nixosRoles.media
      nixosRoles.ide
      # variant
      ./desktop
    ];
  };

  # laptop (for testing)
  laptop = mkConfiguration {
    username = "phx";
    extraModules = [
      # nixos
      ../nixos/bootloader.nix
      ../nixos/kernel.nix
      ../nixos/security.nix
      ../nixos/user.nix
      ../nixos/audio.nix
      ../nixos/virtualization.nix
      ../nixos/qemu.nix
      ../nixos/ssh.nix
      ../nixos/wifi.nix
      ../nixos/cacerts.nix
      ../nixos/proxy.nix
      ../nixos/flatpak.nix
      # roles
      nixosRoles.default
      nixosRoles.development
      nixosRoles.language-toolchains
      nixosRoles.wm-hyprland
      nixosRoles.desktop
      nixosRoles.media
      nixosRoles.ide
      # variant
      ./laptop
    ];
  };

  # vault
  vault = mkConfiguration {
    username = "phx";
    extraModules = [
      # nixos
      ../nixos/bootloader.nix
      ../nixos/kernel.nix
      ../nixos/security.nix
      ../nixos/user.nix
      ../nixos/audio.nix
      ../nixos/ssh.nix
      #../nixos/wifi.nix
      ../nixos/cacerts.nix
      ../nixos/proxy.nix
      # roles
      nixosRoles.default
      nixosRoles.development
      nixosRoles.container-runtime
      nixosRoles.mediaserver
      nixosRoles.homeautomation
      nixosRoles.driveencryption
      nixosRoles.drivemonitoring
      ../roles/nas-samba.nix
      # variant
      ./vault
    ];
  };

  # wsl
  wsl = mkConfiguration {
    username = "phx";
    extraModules = [
      # nixos
      ../nixos/cacerts.nix
      ../nixos/proxy.nix
      # wsl
      inputs.nixos-wsl.nixosModules.wsl
      # roles
      nixosRoles.default
      nixosRoles.development
      nixosRoles.language-toolchains
      nixosRoles.container-runtime
      nixosRoles.administration-tools
      nixosRoles.wm-sway
      nixosRoles.desktop
      nixosRoles.media
      nixosRoles.ide
      # variant
      ./wsl
    ];
  };
}
