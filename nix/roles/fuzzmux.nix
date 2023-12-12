{ self, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    self.packages.${pkgs.system}.fuzzmux
  ];
}
