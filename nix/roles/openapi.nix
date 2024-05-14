{ self, inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.openapi-changes
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.vacuum
  ];
}
