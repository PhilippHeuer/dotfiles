{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.go_1_24
    pkgs.gotools
    pkgs-unstable.templ # write html templates in go
  ];
}
