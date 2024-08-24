# Installation on NixOS

> [!CAUTION]
> This file is incomplete / work in progress.

## Workstation

*Setup*

You can download the Distribution ISO from the [Arch](https://archlinux.org/download/).
You can use Ventoy or Rufus to create a bootable USB stick.

*Prepare*

- update the system: `sudo pacman -Syu`
- install core tooling: `sudo pacman -S git ansible just`
- clone the repository: `git clone https://github.com/PhilippHeuer/dotfiles.git ~/dotfiles`

*Ansible*

Apply the playboon in `./ansible` to apply the configuration:

```bash
ansible-playbook \
    --connection=local \
    --inventory 127.0.0.1, \
    --ask-become-pass \
    ansible/playbook.yml
```
