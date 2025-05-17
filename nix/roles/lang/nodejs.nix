{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.nodejs_24
    #kgs.yarn
    pkgs-unstable.tailwindcss_4
  ];
}
