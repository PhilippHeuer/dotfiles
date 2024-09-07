{ pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.neovim
    pkgs-unstable.gopls
    pkgs-unstable.nixd
    pkgs-unstable.yaml-language-server
    pkgs-unstable.bash-language-server
    pkgs-unstable.rust-analyzer
  ];

  environment.variables.EDITOR = "nvim";
}
