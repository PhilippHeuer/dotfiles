# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
#
#{pkgs ? import ../nixpkgs.nix {} }: rec {
{ pkgs ? import <nixpkgs> { } }: rec {
  # apps
  dotfiles = pkgs.callPackage ./apps/dotfiles.nix { };
  reposync = pkgs.callPackage ./apps/reposync.nix { };
  fuzzmux = pkgs.callPackage ./apps/fuzzmux.nix { };
}
