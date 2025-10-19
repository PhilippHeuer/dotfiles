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
        pkgs-ph = import inputs.nixpkgs-philippheuer {
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
      ../nixos/pullsecret.nix
      ../nixos/user-defaults.nix
      ../nixos/user.nix
      ../nixos/audio.nix
      ../nixos/virtualization.nix
      ../nixos/qemu.nix
      ../nixos/ssh.nix
      ../nixos/cacerts.nix
      ../nixos/proxy.nix
      ../nixos/ntp.nix
      ../nixos/smartd.nix
      #../nixos/flatpak.nix
      ../nixos/de-sddm.nix
      ../nixos/de-plasma.nix
      # core
      nixosRoles.default
      nixosRoles.security-server
      nixosRoles.terminal
      nixosRoles.multimedia
      nixosRoles.wm-hyprland
      nixosRoles.desktop
      # user
      nixosRoles.secretmanagement # secret management
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
      ../nixos/pullsecret.nix
      ../nixos/user-defaults.nix
      ../nixos/user.nix
      ../nixos/audio.nix
      ../nixos/virtualization.nix
      ../nixos/qemu.nix
      ../nixos/ssh.nix
      ../nixos/wifi.nix
      ../nixos/cacerts.nix
      ../nixos/proxy.nix
      ../nixos/ntp.nix
      ../nixos/smartd.nix
      #../nixos/flatpak.nix
      ../nixos/de-sddm.nix
      ../nixos/de-plasma.nix
      # core
      nixosRoles.default
      nixosRoles.security-server
      nixosRoles.terminal
      nixosRoles.multimedia
      nixosRoles.wm-hyprland
      nixosRoles.desktop
      # temporary
      ../roles/mediaserver/plex.nix
      ../roles/mediaserver/samba.nix
      nixosRoles.driveencryption # drive encryption
      nixosRoles.drivemonitoring # drive health monitoring
      # user
      nixosRoles.secretmanagement # secret management
      nixosRoles.development # development tools
      nixosRoles.ide # ide
      nixosRoles.lang # language toolchains
      nixosRoles.container # container runtime
      nixosRoles.admin # admin tools
      nixosRoles.communication # communication
      nixosRoles.streaming # streaming
      nixosRoles.forensic # forensic
      ../roles/multimedia/plex-player.nix
      ../roles/multimedia/jellyfin-player.nix
      # variant
      ./laptop
    ];
  };

  # mhd
  mhd = mkConfiguration {
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
      ../nixos/ntp.nix
      ../nixos/smartd.nix
      ../nixos/systemupdate.nix
      # core
      nixosRoles.default
      nixosRoles.security-server
      nixosRoles.terminal
      # user
      nixosRoles.container # container runtime
      ../roles/homeautomation/blocky.nix # blocky dns
      ../roles/ide/neovim.nix # editor
      # variant
      ./mhd
    ];
  };

  # ahd
  ahd = mkConfiguration {
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
      ../nixos/ntp.nix
      ../nixos/smartd.nix
      ../nixos/systemupdate.nix
      # core
      nixosRoles.default
      nixosRoles.security-server
      nixosRoles.terminal
      # user
      nixosRoles.container # container runtime
      ../roles/homeautomation/blocky.nix # blocky dns
      ../roles/ide/neovim.nix # editor
      # variant
      ./ahd
    ];
  };

  # vault
  vault = mkConfiguration {
    username = "phx";
    extraModules = [
      # nixos
      ../nixos/bootloader.nix
      ../nixos/kernel.nix
      #../nixos/security.nix
      ../nixos/pullsecret.nix
      ../nixos/user-defaults.nix
      ../nixos/user.nix
      ../nixos/audio.nix
      ../nixos/ssh.nix
      #../nixos/wifi.nix
      ../nixos/cacerts.nix
      ../nixos/proxy.nix
      ../nixos/ntp.nix
      ../nixos/smartd.nix
      ../nixos/systemupdate.nix
      # core
      nixosRoles.default
      nixosRoles.security-server
      nixosRoles.terminal
      # user
      nixosRoles.container # container runtime
      nixosRoles.mediaserver # media server
      nixosRoles.homeautomation # home automation
      #../roles/homeautomation/netalertx.nix # netalertx
      nixosRoles.driveencryption # drive encryption
      nixosRoles.drivemonitoring # drive health monitoring
      # misc
      ../roles/services/postgresql.nix # postgres database
      ../roles/services/openwebui.nix # openwebui
      ../roles/services/sillytavern.nix # sillytavern
      # variant
      ./vault
    ];
  };

  # wsl
  wsl = mkConfiguration {
    username = "phx";
    extraModules = [
      # nixos
      ../nixos/pullsecret.nix
      ../nixos/user-defaults.nix
      ../nixos/user.nix
      ../nixos/audio-wsl.nix
      ../nixos/cacerts.nix
      ../nixos/proxy.nix
      ../nixos/ntp.nix
      # wsl
      inputs.nixos-wsl.nixosModules.wsl
      # package managers
      ../nixos/flatpak.nix
      # core
      nixosRoles.default
      nixosRoles.security
      nixosRoles.terminal
      nixosRoles.multimedia
      nixosRoles.wm-sway
      nixosRoles.desktop
      # user
      nixosRoles.secretmanagement # secret management
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
      # variant
      ./wsl
    ];
  };
}
