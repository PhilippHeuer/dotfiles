{
  pkgs,
  pkgs-unstable,
  inputs,
  system,
  lib,
  ...
}:

let
  extensions = inputs.nix-vscode-extensions.extensions.${system};
in
{
  ###
  # vscode with extenstions
  # url: https://marketplace.visualstudio.com/vscode
  environment.systemPackages = with pkgs-unstable; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = [
        # general
        pkgs.vscode-marketplace.editorconfig.editorconfig # editorconfig
        pkgs.vscode-marketplace.eamodio.gitlens # git info
        pkgs.vscode-marketplace.oderwat.indent-rainbow # colorize indentation
        pkgs.vscode-marketplace.wayou.vscode-todo-highlight # highlight todos

        # productivity
        pkgs.vscode-marketplace.vscodevim.vim # vim hotkeys
        pkgs.vscode-marketplace.gruntfuggly.todo-tree # todo tree
        pkgs.vscode-marketplace.rlivings39.fzf-quick-open

        # whiteboard
        pkgs.vscode-marketplace.pomdtr.excalidraw-editor

        # lsp
        pkgs.vscode-marketplace.ms-python.python # python
        pkgs.vscode-marketplace.golang.go # go
        pkgs.vscode-marketplace.ziglang.vscode-zig # zig
        pkgs.vscode-marketplace.jnoortheen.nix-ide # nix
        pkgs.vscode-marketplace.tamasfe.even-better-toml # toml
        pkgs.vscode-marketplace.redhat.vscode-yaml # yaml

        # auto completion
        pkgs.vscode-marketplace.github.copilot
        pkgs.vscode-marketplace.github.copilot-chat

        # theme
        pkgs.vscode-marketplace.catppuccin.catppuccin-vsc
        pkgs.vscode-marketplace.catppuccin.catppuccin-vsc-icons
        pkgs.vscode-marketplace.enkia.tokyo-night
        pkgs.vscode-marketplace.arcticicestudio.nord-visual-studio-code
        pkgs.vscode-marketplace.mvllow.rose-pine

        # other
        pkgs.vscode-marketplace.adpyke.codesnap # code screenshots
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
