<a href="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim"><img src="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim/badges/plugins?style=flat-square" /></a>
<a href="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim"><img src="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim/badges/leaderkey?style=flat-square" /></a>
<a href="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim"><img src="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim/badges/plugin-manager?style=flat-square" /></a>

# dotfiles

## installation

- clone this repository
- `/ansible` contains a ansible playbook to install the required software and prerequisites (see [ansible/README.md](ansible/README.md))
  - `ansible-playbook --connection=local --inventory 127.0.0.1, --ask-become-pass ansible/playbook.yml`
- run `./setup.sh` to symblink the config files from this repository.
- add the init scripts to your `.bashrc`: `. $HOME/.config/bash/init.sh`

## authentication

- copilot: run `:copilot auth` and follow the instructions

## License

Released under the [MIT license](./LICENSE).
