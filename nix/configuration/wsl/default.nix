{
  pkgs,
  username,
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
    wslConf.automount.root = "/mnt";
    wslConf.automount.options = "metadata,uid=1000,gid=1000,umask=022,fmask=111,case=off";
  };

  # shell
  users.defaultUserShell = pkgs.bash;
}
