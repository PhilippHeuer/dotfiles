<a href="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim"><img src="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim/badges/leaderkey?style=flat-square" /></a>
<a href="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim"><img src="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim/badges/plugins?style=flat-square" /></a>
<a href="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim"><img src="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim/badges/plugin-manager?style=flat-square" /></a>

# dotfiles

This repository contains everything needed to reproduce my system and application configuration.

## installation

- [NixOS](./docs/install/nixos.md) **(preferred)**
- [Arch](./docs/install/arch.md)
- [Debian](./docs/install/debian.md)
- [Ubuntu](./docs/install/ubuntu.md)
- [openSUSE](./docs/install/opensuse.md)

## design considerations

### system configuration

**Requirements**

- the system configuration *MUST* be reproducible
- the system configuration *SHOULD* support multiple profiles

**Implementation**

- [NixOS Flakes](https://nixos.wiki/wiki/flakes)
- [Ansible Playbook](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html): Arch, Debian, Ubuntu, openSUSE

### config files

**Requirements**

- support for symlinking (for modifications) and copying files
- rule-based configuration (e.g. only copy kitty config dir if kitty is installed)
- theming support
- templating support for theme-specific values
- avoid using distro-specific tools to manage app configuration files (e.g. Nix Home Manager)

**Implementation**

I created a cli to manage my dotfiles: [dotfiles-cli](https://github.com/PhilippHeuer/dotfiles-cli).
The configuration for the themes and directories is stored in [dotfiles.yaml](./dotfiles.yaml).

### profiles

**Requirements**

- support for different profiles to cater to special environments (e.g. Workstation, Laptop, Windows Subsystem for Linux)

**Implementation**

The following profiles are available:

| Name | Workstation | Laptop | WSL |
| ---- | ----------- | ------ | --- |
| Window Manager | Hyprland, Sway, Plasma  | Hyprland, Sway, Plasma | Sway |
| Terminal Emulator | Kitty | Kitty | Kitty |
| Audio | Pipewire | Pipewire | Pulseaudio |

## License

Released under the [MIT license](./LICENSE).

> [!CAUTION]
> Some files (themes, color-palettes) included in this repository are released under a different license.
> Check [CREDITS.md](./CREDITS.md) for more information.
