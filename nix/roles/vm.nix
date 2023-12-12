{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    virt-what
  ];
}
