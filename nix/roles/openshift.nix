{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs-unstable.openshift # oc
  ];
}
