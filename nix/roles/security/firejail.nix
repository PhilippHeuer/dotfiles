{
  pkgs,
  lib,
  ...
}:

let
  mkFirejail =
    name:
    {
      executableName ? name,
      packageName ? executableName,
      executable ? "${lib.getBin pkgs.${packageName}}/bin/${executableName}",
      profile ? "${pkgs.firejail}/etc/firejail/${executableName}.profile",
      desktop ? "",
      extraArgs ? [ "--container=lxc" ],
      ...
    }:
    {
      inherit executable profile extraArgs;
      desktop = lib.mkIf (desktop != "") desktop;
    };
in
{
  programs.firejail = {
    enable = true;
  };
}
