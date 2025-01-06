{ pkgs, pkgs-unstable, ... }:

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
    pkgs-unstable.ansible-language-server # ansible

    # formatters
    pkgs-unstable.nixfmt-rfc-style
    pkgs-unstable.shfmt
    pkgs-unstable.nufmt

    # lint
    pkgs-unstable.pylint

    # sast
    pkgs.gitleaks
    pkgs.semgrep
  ];

  environment.variables.EDITOR = "nvim";
}
