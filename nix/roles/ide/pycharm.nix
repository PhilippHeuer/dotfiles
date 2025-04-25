{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:

let
  pluginList = [
    # productivity
    #"164" # ideavim
    #"9792" # key-promoter-x
    #"23451" # fuzzy file finder

    # themes
    #"18682" # catppuccin-theme
    #"23029" # catppuccin-icons
    # "18820" # tokyo-night-theme
    #"18141" # rose-pine
    #"10321" # nord

    # auto completion
    #"17718" # github copilot
  ];

  addPlugins = (inputs.nix-jetbrains-plugins.import pkgs).addPlugins;
  pycharm = addPlugins pkgs-unstable.jetbrains.pycharm-community-bin pluginList;
in
{
  environment.systemPackages = [
    pycharm
  ];
}
