{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    sway
    swaybg
    waybar
  ];
}
