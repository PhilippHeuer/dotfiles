{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:

let
  pluginList = [
    # productivity
    "164" # ideavim
    "9792" # key-promoter-x
    "23451" # fuzzy file finder

    # extensions
    "6317" # lombok
    "8607" # nixidea

    # sast
    "7973" # sonarlint

    # themes
    "18682" # catppuccin-theme
    "23029" # catppuccin-icons
    # "18820" # tokyo-night-theme
    "18141" # rose-pine
    "10321" # nord

    # auto completion
    "17718" # github copilot
  ];

  addPlugins = (inputs.nix-jetbrains-plugins.import pkgs-unstable).addPlugins;
  idea-ultimate = addPlugins pkgs.jetbrains.idea-ultimate pluginList;
in
{
  environment.systemPackages = [
    idea-ultimate
  ];
}
