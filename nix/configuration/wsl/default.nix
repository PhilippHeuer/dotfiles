{
  pkgs,
  username,
  lib,
  ...
}: {
  # timezone
  time.timeZone = "Europe/Berlin";

  # wsl
  wsl = {
    enable = true;
    defaultUser = "${username}";
    # startMenuLaunchers = true;
    # nativeSystemd = true;

    # windows interop
    interop = {
      register = false;
      includePath = false;
    };

    # mount options
    wslConf.automount.mountFsTab = true;
    wslConf.automount.root = "/mnt"; # also update path in unmount-x11 activation script
    wslConf.automount.options = "metadata,uid=1000,gid=1000,umask=022,fmask=111,case=off";
  };

  # X11 mount
  system.activationScripts = { # wsl automatically mounts /tmp/.X11-unix
    unmount-x11 = ''
      # unmount /tmp/.X11-unix if it is mounted
      umount /tmp/.X11-unix || true

      # remove wslg x11 mount from systemd.tmpfiles.rules
      ${pkgs.gnused}/bin/sed -i "\|L /tmp/.X11-unix - - - - /mnt/wslg/.X11-unix|d" /etc/tmpfiles.d/00-nixos.conf
    '';
  };
}
