{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    starship
  ];
}
