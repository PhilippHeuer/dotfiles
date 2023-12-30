### user configuration
#
# generate a hashed password with: mkpasswd -m sha-512 <password>

{ lib, config, username, pkgs, ... }:

let
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
    hashedPassword = "$6$spcFyCpOwSWB3CEb$thhYDrJDeRyqWw.cWr0Ar41UPCXZh2.Tgw4PJAFBnT4xHCpgdrJo/OweMeY/R5QEINDJSCH1QbXB/vcDax4ZT0";
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
    
    # ssh keys
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIAbhI9hxpDxO8QQ4mrGeAvyypyarZ6SQwb6Is+Iz3uJ phx"
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAICp00GP8aMaxCWgvthbDcqHMWcAwEwzgOcoatLqqaThdAAAAC3NzaDpwcmltYXJ5 phx-sk1"
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIKOf6dQuq5reydB8gcuHIGWY3TP1MlSCyL0JELuvu9gwAAAAC3NzaDpwcmltYXJ5 phx-sk2"
    ];
  };
}
