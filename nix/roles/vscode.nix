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
            version = "1.178.807";
            sha256 = "sha256-lpXOH4bfAakVLBOghutQRRpHz7nSeouOnnpUxC3TA8E=";
          };
        })
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "github";
            name = "copilot-chat";
            version = "0.15.2024040501";
            sha256 = "sha256-QmGNOjZZA9qJU0GqE1k+6TmTpflk4QeSwEte2JE2bnw=";
          };
        })
        # git
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "eamodio";
            name = "gitlens";
            version = "2024.4.405";
            sha256 = "sha256-q9jD+ghBe7upITHOKm8LeFPkjde4+MB32EnLXYHGzVY=";
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
        # lsp
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "golang";
            name = "Go";
            version = "0.41.2";
            sha256 = "sha256-eD/9UBYxf8kmqxuzY+hgAT0bqSiYw/BbDv2gyB63zY0=";
          };
        })
        # theme
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "Catppuccin";
            name = "catppuccin-vsc";
            version = "3.13.0";
            sha256 = "sha256-z6sQhC0V6j2ws9AyQE6eaTehj+2PpDjDOplB99aTPY8=";
          };
        })
        (vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "Catppuccin";
            name = "catppuccin-vsc-icons";
            version = "1.10.0";
            sha256 = "sha256-6klrnMHAIr+loz7jf7l5EZPLBhgkJODFHL9fzl1MqFI=";
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
