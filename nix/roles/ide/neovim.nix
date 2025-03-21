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
    pkgs.yaml-language-server # yaml
    pkgs.bash-language-server # bash
    pkgs-unstable.ansible-language-server # ansible
    pkgs.zls # zig

    # formatters
    pkgs-unstable.nixfmt-rfc-style
    pkgs-unstable.shfmt
    pkgs-unstable.nufmt
    pkgs-unstable.google-java-format

    # lint
    pkgs-unstable.pylint

    # sast
    pkgs.gitleaks
    pkgs.semgrep
  ];

  environment.variables.EDITOR = "nvim";
}
