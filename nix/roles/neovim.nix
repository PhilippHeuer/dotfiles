{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.neovim
  ];

  environment.variables.EDITOR = "nvim";
}
