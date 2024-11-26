{ pkgs-unstable, ... }:

{
  environment.systemPackages = [
    # neovim
    pkgs-unstable.neovim

    # lsp
    pkgs-unstable.gopls # go
    pkgs-unstable.nixd # nix
    pkgs-unstable.rust-analyzer # rust
    pkgs-unstable.jdt-language-server # java
    pkgs-unstable.yaml-language-server # yaml
    pkgs-unstable.bash-language-server # bash

    # formatters
    pkgs-unstable.nixfmt-rfc-style

    # lint
    pkgs-unstable.pylint
  ];

  environment.variables.EDITOR = "nvim";
}
