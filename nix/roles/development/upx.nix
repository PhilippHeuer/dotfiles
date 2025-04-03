{ pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.upx
  ];
}
