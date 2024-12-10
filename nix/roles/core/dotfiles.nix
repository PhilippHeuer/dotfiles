{
  self,
  inputs,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.dotfiles
  ];
}
