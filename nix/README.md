# NixOS

## Apply Configurations

- `desktop`: `sudo nixos-rebuild switch --flake .#desktop`
- `wsl`: `sudo nixos-rebuild switch --flake .#wsl`

## Flakes

- regenerate `hardware-configuration.nix` -> `sudo nixos-generate-config`

## Generations

- list: `nix profile history --profile /nix/var/nix/profiles/system`
- delete: `sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d`

## WSL

## Update NixOS Release

```bash
sudo nix-channel --add https://nixos.org/channels/nixos-23.11 nixos
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
sudo nix-channel --update
sudo nixos-rebuild switch
```
