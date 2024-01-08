{ pkgs, pkgs-unstable, pkgs-master, ... }:

{
  environment.systemPackages = [
    pkgs-unstable.jetbrains.idea-community
  ];

  ###
  # plugins
  # url: https://plugins.jetbrains.com/
  system.userActivationScripts.idea-community-extensions = ''
    # copilot
    /run/current-system/sw/bin/idea-community installPlugins com.github.copilot
  '';

}
