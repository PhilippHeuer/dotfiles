{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.openldap
  ];
}
