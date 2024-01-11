{ pkgs, pkgs-unstable, ... }:

{
  # install packages
  environment.systemPackages = [
    pkgs-unstable.vscode
  ];

  environment.sessionVariables = rec {
    DONT_PROMPT_WSL_INSTALL = "true"; # allows running vscode in wsl without windows host
  };

  ###
  # extenstion store
  # url: https://marketplace.visualstudio.com/vscode
  system.userActivationScripts.vscode-extensions = ''
    # copilot
    /run/current-system/sw/bin/code --install-extension GitHub.copilot

    # editorconfig
    /run/current-system/sw/bin/code --install-extension EditorConfig.EditorConfig
  '';
}
