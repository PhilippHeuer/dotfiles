{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    k9s
  ];
}
