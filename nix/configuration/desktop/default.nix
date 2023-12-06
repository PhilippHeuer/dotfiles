{
  pkgs,
  username,
  ...
}: {
  # timezone
  time.timeZone = "Europe/Berlin";

  # shell
  users.defaultUserShell = pkgs.bash;
}
