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
      ExecStart = "/usr/bin/tmux start-server || /bin/true";
      ExecStop = "/usr/bin/tmux kill-server || /bin/true";
    };
    wantedBy = [ "default.target" ];
  };
}
