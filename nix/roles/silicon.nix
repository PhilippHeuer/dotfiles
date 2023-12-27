{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    silicon
  ];
}
