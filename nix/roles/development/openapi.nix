{ self, inputs, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.openapi-changes
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.vacuum
  ];
}
