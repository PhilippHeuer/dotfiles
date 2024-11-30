{ self, inputs, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.wallpapers
  ];
}
