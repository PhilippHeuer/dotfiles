{ pkgs, pkgs-unstable, inputs, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.vault # cli
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.vault-token-helper # vault token helper
  ];
}
