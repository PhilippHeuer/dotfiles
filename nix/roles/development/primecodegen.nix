{
  self,
  inputs,
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.primecodegen
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.primecodegen-app
  ];
}
