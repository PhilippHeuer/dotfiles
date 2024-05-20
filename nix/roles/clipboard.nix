{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wl-clipboard # wayland clipboard manager
    wl-clipboard-x11 # X11 clipboard manager
    cliphist # clipboard history
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.clipboard-sync # clipboard syncronization
  ];

  systemd.user.services.clipboard-sync = {
    enable = true;
    description = "clipboard syncronization service";
    environment = {
      RUST_BACKTRACE = "1";
    };
    unitConfig = {
      Type = "simple";
    };
    serviceConfig = {
      ExecStart = "/run/current-system/sw/bin/clipboard-sync";
      Restart = "always";
      RestartSec = "5";
    };
  };
}
