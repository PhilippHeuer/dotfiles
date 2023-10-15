<a href="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim"><img src="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim/badges/leaderkey?style=flat-square" /></a>
<a href="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim"><img src="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim/badges/plugins?style=flat-square" /></a>
<a href="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim"><img src="https://dotfyle.com/PhilippHeuer/dotfiles-config-nvim/badges/plugin-manager?style=flat-square" /></a>

# dotfiles

## overview

| Component                                          | Description                                                 |
| -------------------------------------------------- | ----------------------------------------------------------- |
| [Nushell](https://www.nushell.sh)                  | Default Shell                                               |
| [Starship](https://starship.rs/)                   | Shell Prompt                                                |
| [TMUX](https://en.wikipedia.org/wiki/Tmux)         | Terminal Multiplexer                                        |
| [Neovim](https://neovim.io/)                       | Text Editor                                                 |
| [FuzzMux](https://github.com/PhilippHeuer/fuzzmux) | TMUX Session Manager - Fuzzy Search Projects, SSH, K8S, ... |
| [Bat](https://github.com/sharkdp/bat)              | cat replacement                                             |
| [Rg](https://github.com/BurntSushi/ripgrep)        | grep replacement                                            |
| [K9S](https://github.com/derailed/k9s)             | kubernetes cli                                              |

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
