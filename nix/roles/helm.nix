{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.kubernetes-helm
    pkgs-unstable.helmfile
  ];
}
