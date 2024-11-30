{ pkgs, pkgs-unstable, inputs, system, lib, ... }:

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
        extensions.vscode-marketplace.editorconfig.editorconfig # editorconfig
        extensions.vscode-marketplace.eamodio.gitlens # git info
        extensions.vscode-marketplace.oderwat.indent-rainbow # colorize indentation
        extensions.vscode-marketplace.wayou.vscode-todo-highlight # highlight todos

        # productivity
        extensions.vscode-marketplace.vscodevim.vim # vim hotkeys
        extensions.vscode-marketplace.gruntfuggly.todo-tree # todo tree
        extensions.vscode-marketplace.rlivings39.fzf-quick-open

        # whiteboard
        extensions.vscode-marketplace.pomdtr.excalidraw-editor

        # lsp
        extensions.vscode-marketplace.ms-python.python # python
        extensions.vscode-marketplace.golang.go # go
        extensions.vscode-marketplace.ziglang.vscode-zig # zig
        extensions.vscode-marketplace.jnoortheen.nix-ide # nix
        extensions.vscode-marketplace.tamasfe.even-better-toml # toml
        extensions.vscode-marketplace.redhat.vscode-yaml # yaml

        # auto completion
        extensions.vscode-marketplace.github.copilot
        extensions.vscode-marketplace.github.copilot-chat

        # theme
        extensions.vscode-marketplace.catppuccin.catppuccin-vsc
        extensions.vscode-marketplace.catppuccin.catppuccin-vsc-icons
        extensions.vscode-marketplace.enkia.tokyo-night
        extensions.vscode-marketplace.arcticicestudio.nord-visual-studio-code
        extensions.vscode-marketplace.mvllow.rose-pine

        # other
        extensions.vscode-marketplace.adpyke.codesnap # code screenshots
      ];
    })
  ];

  programs.firejail.wrappedBinaries.vscodium = {
    executable = "${lib.getBin pkgs-unstable.vscodium}/bin/vscodium";
    profile = "${pkgs.firejail}/etc/firejail/vscodium.profile";
  };

  environment.sessionVariables = rec {
    DONT_PROMPT_WSL_INSTALL = "true"; # allows running vscode in wsl without windows host
  };
}
