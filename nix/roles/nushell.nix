{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nushell
  ];
}
