{ lib, config, username, pkgs, ... }:

{
  users = {
    # forbit user creation
    mutableUsers = false;

    # default shell
    defaultUserShell = pkgs.bash;
  };
}
