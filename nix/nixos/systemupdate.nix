{ pkgs, config, ... }:

let
  updateScript = pkgs.writeScript "updateScript.sh" ''
    #!${pkgs.bash}/bin/bash

    # pull
    if [ -d /etc/nixos/dotfiles ]; then
      cd /etc/nixos/dotfiles
      ${pkgs.git}/bin/git pull
    else
      mkdir -p /etc/nixos/dotfiles
      ${pkgs.git}/bin/git clone https://github.com/PhilippHeuer/dotfiles.git /etc/nixos/dotfiles
    fi

    # update
    cd /etc/nixos/dotfiles/nix
    ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --flake path:.#${config.networking.hostName}
  '';
in
{
  systemd.services."system-update" = {
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c '${updateScript}'";
    };
  };

  systemd.timers."system-update" = {
    enable = true;
    description = "Daily update of the system";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* 03:00:00";
      Persistent = true;
    };
  };
}
