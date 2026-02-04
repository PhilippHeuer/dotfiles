{
  pkgs,
  lib,
  config,
  ...
}:

{
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = lib.mkDefault "24.05"; # Did you read the comment?

  boot = {
    plymouth.enable = true;
    # tmp.useTmpfs = true;
    tmp.cleanOnBoot = !config.boot.tmp.useTmpfs;
  };

  # allows some programs (traceroute, ping, ...) to be run without root privileges (SUID wrapper)
  programs.mtr.enable = true;

  # increase open file limit for sudoers
  security.pam.loginLimits = [
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];

  # systemd extra config
  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
  };

  # default shell
  users.defaultUserShell = pkgs.bash;

  # disable default editor
  programs.nano.enable = false;
  programs.nano.syntaxHighlight = false;

  # support to run unpatched binaries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    glib
    zlib
  ];

  # no idea where this dependency comes from
  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];
}
