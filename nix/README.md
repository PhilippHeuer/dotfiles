# NixOS

## Common Commands

- `nix flake show`: show flake information
- `nix flake update`: update dependencies / lock file
- `sudo nixos-generate-config`: generate hardware configuration file `hardware-configuration.nix`

## Apply Configurations

- `desktop`: `sudo nixos-rebuild switch --flake .#desktop`
- `laptop`: `sudo nixos-rebuild switch --flake .#laptop`
- `wsl`: `sudo nixos-rebuild switch --flake .#wsl`

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

- add `git` to the `environment.systemPackages` list.

Finally, run `sudo nixos-rebuild switch` to apply the changes.

## Resources

- [NixOS Wiki](https://nixos.wiki/wiki/Main_Page)
- [NixOS Options](https://mynixos.com/)
