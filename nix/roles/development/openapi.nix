{
  self,
  inputs,
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.openapi-changes
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.vacuum
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.oasdiff
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.printing-press
    pkgs.redocly
  ];
}
