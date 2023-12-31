{
  pkgs,
  username,
  ...
}: {
  # timezone
  time.timeZone = "Europe/Berlin";

  # hostname
  networking.hostName = "phx-desktop";

  # shell
  users.defaultUserShell = pkgs.bash;
}
