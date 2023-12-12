{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wayland
    xwayland
  ];
}
