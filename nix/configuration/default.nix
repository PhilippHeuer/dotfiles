{
  inputs,
  outputs,
  self,
}:
let
  nixosRoles = import ../roles;

  # utility function to create a configuration
  mkConfiguration =
    {
      username,
      system ? "x86_64-linux",
      defaultModules ? true,
      extraModules ? [ ],
    }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit
          inputs
          outputs
          self
          username
          system
          ;
        pkgs-unstable = import inputs.nixpkgs-unstable {
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

in
{
  # desktop
  desktop = mkConfiguration {
    username = "phx";
    extraModules = [
      # nixos
      ../nixos/bootloader.nix
      ../nixos/kernel.nix
      ../nixos/security.nix
      ../nixos/tpm.nix
      ../nixos/user-defaults.nix
      ../nixos/user.nix
      ../nixos/audio.nix
      ../nixos/virtualization.nix
      ../nixos/qemu.nix
      ../nixos/ssh.nix
      ../nixos/cacerts.nix
      ../nixos/proxy.nix
      ../nixos/smartd.nix
      #../nixos/flatpak.nix
      ../nixos/de-sddm.nix
      ../nixos/de-plasma.nix
      # core
      nixosRoles.default
      nixosRoles.terminal
      nixosRoles.wm-hyprland
      nixosRoles.desktop
      # user
      nixosRoles.development # development tools
      nixosRoles.ide # ide
      nixosRoles.lang # language toolchains
      nixosRoles.container # container runtime
      nixosRoles.admin # admin tools
      nixosRoles.communication # communication
      nixosRoles.streaming # streaming
      nixosRoles.forensic # forensic
      nixosRoles.games # games
      # misc
      ../roles/misc/qbittorrent.nix # torrent
      ../roles/misc/gramps.nix # genealogy / family tree
      ../roles/misc/krita.nix # creative / painting
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
      ../nixos/tpm.nix
      ../nixos/user-defaults.nix
      ../nixos/user.nix
      ../nixos/audio.nix
      ../nixos/virtualization.nix
      ../nixos/qemu.nix
      ../nixos/ssh.nix
      ../nixos/wifi.nix
      ../nixos/cacerts.nix
      ../nixos/proxy.nix
      ../nixos/smartd.nix
      #../nixos/flatpak.nix
      ../nixos/de-sddm.nix
      ../nixos/de-plasma.nix
      # core
      nixosRoles.default
      nixosRoles.terminal
      nixosRoles.wm-hyprland
      nixosRoles.desktop
      # user
      nixosRoles.development # development tools
      nixosRoles.ide # ide
      nixosRoles.lang # language toolchains
      nixosRoles.container # container runtime
      nixosRoles.admin # admin tools
      nixosRoles.communication # communication
      nixosRoles.streaming # streaming
      nixosRoles.forensic # forensic
      nixosRoles.games # games
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
      ../nixos/user-defaults.nix
      ../nixos/user.nix
      ../nixos/audio.nix
      ../nixos/ssh.nix
      #../nixos/wifi.nix
      ../nixos/cacerts.nix
      ../nixos/proxy.nix
      ../nixos/smartd.nix
      # core
      nixosRoles.default
      nixosRoles.terminal
      # user
      nixosRoles.container # container runtime

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
      ../nixos/user-defaults.nix
      ../nixos/user.nix
      ../nixos/audio-wsl.nix
      ../nixos/cacerts.nix
      ../nixos/proxy.nix
      # wsl
      inputs.nixos-wsl.nixosModules.wsl
      # core
      nixosRoles.default
      nixosRoles.terminal
      nixosRoles.wm-sway
      nixosRoles.desktop
      # user
      nixosRoles.development # development tools
      nixosRoles.ide # ide
      nixosRoles.lang # language toolchains
      nixosRoles.container # container runtime
      nixosRoles.admin # admin tools
      nixosRoles.communication # communication
      nixosRoles.streaming # streaming
      nixosRoles.forensic # forensic
      # misc
      ../roles/misc/qbittorrent.nix # torrent
      ../roles/misc/gramps.nix # genealogy / family tree
      ../roles/misc/krita.nix # creative / painting
      # variant
      ./wsl
    ];
  };
}
