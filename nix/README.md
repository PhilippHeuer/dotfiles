# NixOS

## Common Commands

- `nix flake show`: show flake information
- `nix flake update`: update dependencies / lock file
- `sudo nixos-generate-config`: generate hardware configuration file `hardware-configuration.nix`

## Apply Configurations

- `desktop`: `sudo nixos-rebuild switch --flake .#desktop`
- `laptop`: `sudo nixos-rebuild switch --flake .#laptop`
- `wsl`: `sudo nixos-rebuild switch --flake path:.#wsl`

## Bootloader

- cleanup -> `sudo nix-collect-garbage --delete-older-than 7d`
- generate -> `sudo nixos-rebuild boot`

## Generations

- list: `nix profile history --profile /nix/var/nix/profiles/system`
- delete: `sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d`

## First Run

- Flakes are still experimental, so you need to enable them in `/etc/nixos/configuration.nix`:

```nix
# Enable Flakes and the new command-line tool
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

Finally, run `sudo nixos-rebuild switch` to apply the changes.

## WSL

### Setup

*Import WSL Distro*

`wsl --import NixOS .\NixOS\ nixos-wsl.tar.gz --version 2`

*Initial Update*

`sudo nix-channel --update`
`sudo nixos-rebuild switch`

*Edit `configuration.nix` to enable flakes*

`sudo sed -i '/^}$/i \  nix.settings.experimental-features = [ "nix-command" "flakes" ];' /etc/nixos/configuration.nix`
`sudo nixos-rebuild switch`

### Restore

You can enter older generations using the following command:

- `wsl -d NixOS --system --user root -- /mnt/wslg/distro/bin/nixos-wsl-recovery`
- `wsl -d NixOS --system --user root -- /mnt/wslg/distro/bin/nixos-wsl-recovery --system /nix/var/nix/profiles/system-42-link`

## SOPS

- generate a new private key `nix shell nixpkgs#age -c age-keygen -o ~/.config/sops/age/keys.txt`
- get public key: `nix shell nixpkgs#age -c age-keygen -y ~/.config/sops/age/keys.txt`

## Resources

- [NixOS Wiki](https://nixos.wiki/wiki/Main_Page)
- [NixOS Options](https://mynixos.com/)
- [NixPKG Search](https://search.nixos.org/packages)
