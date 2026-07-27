{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:

let
  pluginList = [
    # productivity
    "IdeaVIM" # ideavim
    "Key Promoter X" # key-promoter-x

    # jvm
    "Lombook Plugin" # lombok
    "org.sonarlint.idea" # sonarlint

    # themes
    "com.github.catppuccin.jetbrains"
    "com.github.catppuccin.jetbrains_icons"
    "com.github.jmorjsm.rosepineintellij"
    "com.arcticicestudio.nord.jetbrains"

    # auto completion
    "com.github.copilot" # github copilot
    "com.intellij.ml.llm" # jetbrains ai assistant
    "org.jetbrains.junie" # jetbrains junie
  ];

  basePkg = pkgs-unstable.jetbrains.idea;

  idePkg = inputs.nix-jetbrains-plugins.lib.buildIdeWithPlugins pkgs-unstable basePkg pluginList;
in
{
  environment.systemPackages = [
    idePkg
  ];
}
