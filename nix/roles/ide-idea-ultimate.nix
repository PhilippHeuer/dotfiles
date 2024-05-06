{ pkgs, pkgs-unstable, pkgs-master, inputs, ... }:

let
  pluginList = [
    # hotkeys
    "164" # ideavim
    "9792" # key-promoter-x

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

    # fun
    "8575" # nyan-progress-bar
  ];

  addPlugins = (inputs.nix-jetbrains-plugins.import pkgs-master).addPlugins;
  idea-ultimate = addPlugins pkgs-master.jetbrains.idea-ultimate pluginList;
in {
  environment.systemPackages = [
    idea-ultimate
  ];
}
