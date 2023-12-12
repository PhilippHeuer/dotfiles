{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    click
  ];
}
