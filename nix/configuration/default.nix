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
      specialArgs = {inherit inputs outputs self username;};
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
      ../nixos/kernel.nix
      ../nixos/user.nix
      # roles
      nixosRoles.default
      # variant
      ./desktop
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
      # variant
      ./wsl
    ];
  };
}
