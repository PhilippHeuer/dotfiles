# Installation on NixOS

## Workstation

*Setup*

You can download the Distribution ISO from the [NixOS Website](https://nixos.org/download/).
You can use Ventoy or Rufus to create a bootable USB stick.

*Initial Update*

`sudo nix-channel --update`
`sudo nixos-rebuild switch`

*Enable Experimental Features*

via env:

`export NIX_CONFIG="experimental-features = nix-command flakes"`

via `configuration.nix`:

`sudo sed -i '/^}$/i \  nix.settings.experimental-features = [ "nix-command" "flakes" ];' /etc/nixos/configuration.nix`

via `curl`: (caution: contains my ssh public key)

- `nix-shell -p curl`
- `sudo curl -o /etc/nixos/configuration.nix https://raw.githubusercontent.com/philippheuer/dotfiles/main/nix/initial-configuration.nix`
- `sudo nixos-generate-config && sudo nixos-rebuild switch`

## WSL

### Setup

*Setup WSL Distro*

- Download the latest `nixos-wsl.tar.gz` from [NixOS-WSL Releases](https://github.com/nix-community/NixOS-WSL/releases)
- Import the distro using the following command: `wsl --import NixOS .\NixOS\ nixos-wsl.tar.gz --version 2`

*Initial Update*

`sudo nix-channel --update`
`sudo nixos-rebuild switch`

*Enable Experimental Features*

via env:

`export NIX_CONFIG="experimental-features = nix-command flakes"`

via `configuration.nix`:

`sudo sed -i '/^}$/i \  nix.settings.experimental-features = [ "nix-command" "flakes" ];' /etc/nixos/configuration.nix`

### Restore

If your latest generation is broken, you can enter older generations using the following command:

- `wsl -d NixOS --system --user root -- /mnt/wslg/distro/bin/nixos-wsl-recovery`
- `wsl -d NixOS --system --user root -- /mnt/wslg/distro/bin/nixos-wsl-recovery --system /nix/var/nix/profiles/system-42-link`

## Configurations

After the environment is prepared, you can apply a profile:

- `desktop`: `cd nix && sudo nixos-rebuild switch --flake .#desktop`
- `laptop`: `cd nix && sudo nixos-rebuild switch --flake .#laptop`
- `wsl`: `cd nix && sudo nixos-rebuild switch --flake path:.#wsl`

## Resources

- [NixOS Wiki](https://nixos.wiki/wiki/Main_Page)
- [NixOS Options](https://mynixos.com/)
- [NixPKG Search](https://search.nixos.org/packages)
