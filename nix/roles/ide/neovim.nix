{ pkgs-unstable, ... }:

{
  environment.systemPackages = [
    # neovim
    pkgs-unstable.neovim

    # lsp
    pkgs-unstable.gopls
    pkgs-unstable.nixd
    pkgs-unstable.yaml-language-server
    pkgs-unstable.bash-language-server
    pkgs-unstable.rust-analyzer

    # formatters
    pkgs-unstable.nixfmt-rfc-style
  ];

  environment.variables.EDITOR = "nvim";
}
