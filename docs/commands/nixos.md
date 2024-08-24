# NixOS Command Reference

## General

- `nix flake show`: show flake information
- `nix flake update`: update dependencies / lock file
- `sudo nixos-generate-config`: generate hardware configuration file `hardware-configuration.nix`

## Bootloader

- generate: `sudo nixos-rebuild boot`

## Generations

- list: `nix profile history --profile /nix/var/nix/profiles/system`
- delete: `sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d`

## Garbage Collection

- `sudo nix-collect-garbage --delete-older-than 7d`

## SOPS Setup

- generate a new private key: `nix shell nixpkgs#age -c age-keygen -o ~/.config/sops/age/keys.txt`
- get public key: `nix shell nixpkgs#age -c age-keygen -y ~/.config/sops/age/keys.txt`
