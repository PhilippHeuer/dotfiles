{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.ollama
  ];
}
