{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    temurin-bin-21
  ];
}
