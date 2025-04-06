{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.nodejs_23
    #kgs.yarn
    pkgs-unstable.tailwindcss_4
  ];
}
