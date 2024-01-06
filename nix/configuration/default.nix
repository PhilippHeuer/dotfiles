{
  inputs,
  outputs,
  self,
}: let
  nixosRoles = import ../roles;

  # utility function to create a configuration
  mkConfiguration = {
    username,
    nixpkgs ? inputs.nixpkgs,
    system ? "x86_64-linux",
    defaultModules ? true,
    extraModules ? [],
  }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs outputs self username;
        pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${system};
        pkgs-master = inputs.nixpkgs-master.legacyPackages.${system};
      };
      modules =
        nixpkgs.lib.optionals defaultModules [
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
      ../nixos/user.nix
      ../nixos/audio.nix
      ../nixos/virtualization.nix
      ../nixos/ssh.nix
      # roles
      nixosRoles.default
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
      ../nixos/user.nix
      ../nixos/audio.nix
      ../nixos/virtualization.nix
      ../nixos/ssh.nix
      ../nixos/wifi.nix
      # roles
      nixosRoles.default
      nixosRoles.wm-hyprland
      nixosRoles.desktop
      nixosRoles.media
      nixosRoles.ide
      # variant
      ./laptop
    ];
  };

  # wsl
  wsl = mkConfiguration {
    username = "phx";
    extraModules = [
      # nixos
      inputs.nixos-wsl.nixosModules.wsl
      # roles
      nixosRoles.default
      nixosRoles.wm-sway
      nixosRoles.wm-hyprland
      nixosRoles.desktop
      nixosRoles.media
      nixosRoles.ide
      # variant
      ./wsl
    ];
  };
}
