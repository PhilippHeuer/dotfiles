{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.jetbrains.idea-ultimate
  ];

  ###
  # plugins
  # url: https://plugins.jetbrains.com/
  system.userActivationScripts.idea-ultimate-extensions = ''
    # copilot
    /run/current-system/sw/bin/idea-ultimate installPlugins com.github.copilot
  '';
}
