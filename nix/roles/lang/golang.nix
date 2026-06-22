{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.go_1_26
    pkgs.gotools
    pkgs-unstable.templ # write html templates in go
  ];
}
