{ pkgs, pkgs-unstable, inputs, system, ... }:

let
  extensions = inputs.nix-vscode-extensions.extensions.${system};
in {
  ###
  # vscode with extenstions
  # url: https://marketplace.visualstudio.com/vscode
  environment.systemPackages = with pkgs-unstable; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = [
        # general
        extensions.vscode-marketplace.editorconfig.editorconfig

        # ai
        extensions.vscode-marketplace.github.copilot
        extensions.vscode-marketplace.github.copilot-chat

        # hotkeys
        extensions.vscode-marketplace.vscodevim.vim

        # git
        extensions.vscode-marketplace.eamodio.gitlens

        # ident rainbow
        extensions.vscode-marketplace.oderwat.indent-rainbow

        # todo highlight
        extensions.vscode-marketplace.wayou.vscode-todo-highlight

        # lsp
        extensions.vscode-marketplace.golang.go

        # theme
        extensions.vscode-marketplace.catppuccin.catppuccin-vsc
        extensions.vscode-marketplace.catppuccin.catppuccin-vsc-icons
        extensions.vscode-marketplace.enkia.tokyo-night
        extensions.vscode-marketplace.arcticicestudio.nord-visual-studio-code
        extensions.vscode-marketplace.mvllow.rose-pine
      ];
    })
  ];

  environment.sessionVariables = rec {
    DONT_PROMPT_WSL_INSTALL = "true"; # allows running vscode in wsl without windows host
  };
}
