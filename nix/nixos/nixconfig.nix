# nix os configuration
#
{ inputs, lib, ... }:

{
  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = lib.mkDefault true;

      # enable experimental features
      experimental-features = [
        "nix-command"
        "flakes"
        "repl-flake"
      ];
      
      # system features
      # system-features = [ "kvm" "big-parallel" "nixos-test" ];

      # Disable global flake registry
      flake-registry = ""; 

      # do not warn if the git repo is dirty
      warn-dirty = false;
    };

    # generation garbage collection
    gc = {
      # once per week
      automatic = true;
      dates = "weekly";

      # keep the last 7 generations
      options = "--delete-older-than +7";
    };

    # Add each flake input as a registry
    # To make nix3 commands consistent with the flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # Add nixpkgs input to NIX_PATH
    # This lets nix2 commands still use <nixpkgs>
    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];
  };

  nixpkgs = {
    config = {
      # allow unfree packages
      allowUnfree = true;
    };
  };
}
