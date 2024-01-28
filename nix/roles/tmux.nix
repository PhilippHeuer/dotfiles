{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tmux
  ];

  systemd.user.services.tmux-server = {
    enable = true;
    description = "TMUX Server Service";
    unitConfig = {
      Type = "simple";
    };
    serviceConfig = {
      ExecStart = "/run/current-system/sw/bin/tmux start-server || /bin/true";
      ExecStop = "/run/current-system/sw/bin/tmux kill-server || /bin/true";
    };
    wantedBy = [ "default.target" ];
  };
}
