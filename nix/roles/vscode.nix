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
            version = "1.172.758";
            sha256 = "sha256-sK3IiA4mQ6Hse+UpZ81Zb5iBSREzTrs7ypsfGbJiXm4=";
          };
        })
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "github";
            name = "copilot-chat";
            version = "0.14.2024030801";
            sha256 = "sha256-v9RS+pEEQzq2t0EY/gVTTfIwRlGmIuIq2qCockDpsn8=";
          };
        })
        # git
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "eamodio";
            name = "gitlens";
            version = "2024.3.704";
            sha256 = "sha256-ax7Qng3o8wKj+cPmA/bz0eNw4uSO0ckTGovvs79E9xE=";
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
            version = "0.41.1";
            sha256 = "sha256-tSt0IqRuE3nJgMYvdYUz5QDtzOsKKQqyW2KD1FEhkEQ=";
          };
        })
        # theme
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "Catppuccin";
            name = "catppuccin-vsc";
            version = "3.11.2";
            sha256 = "sha256-riHhw7PnSVC0zE4VU30IHS4MxAGvDLqOb1eTtnairBM=";
          };
        })
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "Catppuccin";
            name = "catppuccin-vsc-icons";
            version = "1.9.1";
            sha256 = "sha256-Ge6x3ORa8wtKcSCsRhOBPpseCsDhS3pRTY2aVAHCVhE=";
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
