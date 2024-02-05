{ pkgs, pkgs-unstable, ... }:

{
  ###
  # vscode with extenstions
  # url: https://marketplace.visualstudio.com/vscode
  environment.systemPackages = with pkgs-unstable; [
    (vscode-with-extensions.override {
      vscode = vscodium;
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
        # git
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "eamodio";
            name = "gitlens";
            version = "2024.1.2604";
            sha256 = "sha256-TkpK1+G2L5uo8BFdR96tWRHOH5iK4X9Ug/lBqHhvIQ8=";
          };
        })
        # ident rainbow
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "oderwat";
            name = "indent-rainbow";
            version = "8.3.1";
            sha256 = "sha256-dOicya0B2sriTcDSdCyhtp0Mcx5b6TUaFKVb0YU3jUc=";
          };
        })
        # todo highlight
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "wayou";
            name = "vscode-todo-highlight";
            version = "1.0.5";
            sha256 = "sha256-CQVtMdt/fZcNIbH/KybJixnLqCsz5iF1U0k+GfL65Ok=";
          };
        })
        # markdown notes
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "kortina";
            name = "vscode-markdown-notes";
            version = "0.0.27";
            sha256 = "sha256-KiEHxySFXHd+lGh9RPAxsevJXIvm01AXhfNifl8FEvc=";
          };
        })
        # lsp
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "golang";
            name = "Go";
            version = "0.40.3";
            sha256 = "sha256-FWC9ALnp5ZsUqHFOPS5CcKsqf5O6rpr4oMfenvZlcZY=";
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
