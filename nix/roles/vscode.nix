{ pkgs, pkgs-unstable, ... }:

{
  ###
  # vscode with extenstions
  # url: https://marketplace.visualstudio.com/vscode
  environment.systemPackages = with pkgs-unstable; [
    (vscode-with-extensions.override {
      vscodeExtensions = [
        vscode-extensions.editorconfig.editorconfig
        # copilot
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "github";
            name = "copilot";
            version = "1.155.677";
            sha256 = "sha256-28exhio6twVrtRgo4AKiYYr+dLHJG0zpkMhE1TXlE5Q=";
          };
        })
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "github";
            name = "copilot-chat";
            version = "0.12.2024012601";
            sha256 = "sha256-QsXLM2MlmyxG5d0HZem1eAbmPd/GcXZ1MCirZno9NX4=";
          };
        })
        # theme
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "Catppuccin";
            name = "catppuccin-vsc";
            version = "3.11.0";
            sha256 = "sha256-jUSYheKalC4mBlSr2iEXb4d/p76IbtgQqKvftG/of4k=";
          };
        })
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "Catppuccin";
            name = "catppuccin-vsc-icons";
            version = "1.5.0";
            sha256 = "sha256-VQD/pf96xa99IRTVrpCfZuY/ryL+ueMfmI5kQ6k119k=";
          };
        })
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "enkia";
            name = "tokyo-night";
            version = "1.0.6";
            sha256 = "sha256-VWdUAU6SC7/dNDIOJmSGuIeffbwmcfeGhuSDmUE7Dig=";
          };
        })
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "arcticicestudio";
            name = "nord-visual-studio-code";
            version = "0.19.0";
            sha256 = "sha256-awbqFv6YuYI0tzM/QbHRTUl4B2vNUdy52F4nPmv+dRU=";
          };
        })
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "mvllow";
            name = "rose-pine";
            version = "2.9.0";
            sha256 = "sha256-ibx19iDUXumpc1vTIUubceFyWyD7nUEBlunFDMcdW6E=";
          };
        })
      ];
    })
  ];

  environment.sessionVariables = rec {
    DONT_PROMPT_WSL_INSTALL = "true"; # allows running vscode in wsl without windows host
  };
}
