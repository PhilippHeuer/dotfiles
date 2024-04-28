{ self, inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wl-clipboard # clipboard manager
    cliphist # clipboard history
  ];
}
