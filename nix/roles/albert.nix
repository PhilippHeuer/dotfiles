{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    albert
  ];
}
