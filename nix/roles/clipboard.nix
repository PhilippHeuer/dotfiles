{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wl-clipboard # wayland clipboard manager
    wl-clipboard-x11 # X11 clipboard manager
    cliphist # clipboard history
  ];
}
