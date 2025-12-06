{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.nixpkgs-philippheuer.packages.${pkgs.system}.clipboard-sync # clipboard syncronization
  ];

  #systemd.user.services.clipboard-sync = {
  #  enable = true;
  #  description = "clipboard syncronization service";
  #  environment = {
  #    RUST_BACKTRACE = "1";
  #  };
  #  unitConfig = {
  #    Type = "simple";
  #  };
  #  serviceConfig = {
  #    ExecStart = "/run/current-system/sw/bin/clipboard-sync --log-level=debug";
  #    Restart = "always";
  #    RestartSec = "5";
  #  };
  #};
}
