{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
  ];

  environment.sessionVariables = rec {
    DONT_PROMPT_WSL_INSTALL  = "true"; # allows running vscode in wsl without windows host
  };
}
