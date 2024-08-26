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

    # hostname
    wslConf.network.hostname = "nixos";
  };

  # activation scripts
  system.activationScripts = {
    # remove x11 mount
    unmount-x11 = ''
      # unmount /tmp/.X11-unix if it is mounted
      umount /tmp/.X11-unix 2>/dev/null || true
      umount /tmp/.X11-unix/X0 2>/dev/null || true
    '';

    # remove hardcoded hostname
    wslconf-hostname-fix = ''
      ${pkgs.gnused}/bin/sed -i "\|hostname=nixos|d" /etc/wsl.conf
    '';

    # start systemd user service for wsl user (sometimes it doesn't start automatically)
    start-systemd-user = ''
      ${pkgs.systemd}/bin/systemctl start user@1000.service
    '';
  };

  # secrets
  sops.age.keyFile = lib.mkForce "/home/${username}/.config/sops/age/keys.txt";
}
