{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.dotnet-sdk_9
  ];
}
