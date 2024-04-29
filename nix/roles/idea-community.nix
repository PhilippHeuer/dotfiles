{ pkgs, pkgs-unstable, ... }:

{
  ###
  # jetbrains ide with plugins
  # plugins: https://plugins.jetbrains.com/
  # json: https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/jetbrains/plugins/plugins.json
  environment.systemPackages = with pkgs-unstable; [
    (jetbrains.plugins.addPlugins jetbrains.idea-community-bin [
      "github-copilot" # https://plugins.jetbrains.com/plugin/17718-github-copilot
    ])
  ];
}
