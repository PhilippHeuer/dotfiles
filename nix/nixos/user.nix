{
  lib,
  config,
  username,
  pkgs,
  ...
}: let
  sudoRule = {
    users = ["${username}"];
    commands = [
      {
        command = "ALL";
        options = ["NOPASSWD"];
      }
    ];
  };
in {
  users = {
    # forbit user creation
    mutableUsers = false;

    # default shell
    defaultUserShell = pkgs.bash;
  };

  users.users.${username} = {
    isNormalUser = true;
    extraGroups =
      [
        "wheel"
        "audio"
        "video"
        "networkmanager"
      ]
      ++ lib.optionals config.virtualisation.lxd.enable ["lxd"]
      ++ lib.optionals config.virtualisation.docker.enable ["docker"]
      ++ lib.optionals config.virtualisation.podman.enable ["podman"]
      ++ lib.optionals config.virtualisation.libvirtd.enable ["libvirtd"]
      ++ lib.optionals config.programs.adb.enable ["adbusers"];
  };
}
