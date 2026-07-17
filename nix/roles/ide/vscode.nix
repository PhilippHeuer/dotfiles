{
  pkgs,
  pkgs-unstable,
  inputs,
  system,
  lib,
  ...
}:

let
  vscodiumPkg = inputs.nixpkgs-philippheuer.packages.${pkgs.system}.vscodium;
  marketplace = (inputs.nix-vscode-extensions.extensions.${system}.forVSCodeVersion vscodiumPkg.vscodeVersion).vscode-marketplace-release;
in
{
  ###
  # vscode with extenstions
  # url: https://marketplace.visualstudio.com/vscode
  environment.systemPackages = [
    (pkgs-unstable.vscode-with-extensions.override {
      vscode = vscodiumPkg;
      vscodeExtensions = [
        # general
        marketplace.editorconfig.editorconfig # editorconfig
        marketplace.eamodio.gitlens # git info
        marketplace.oderwat.indent-rainbow # colorize indentation
        marketplace.wayou.vscode-todo-highlight # highlight todos

        # productivity
        #marketplace.vscodevim.vim # vim hotkeys
        marketplace.gruntfuggly.todo-tree # todo tree

        # whiteboard
        marketplace.pomdtr.excalidraw-editor

        # lsp
        marketplace.ms-python.python # python
        marketplace.golang.go # go
        marketplace.ziglang.vscode-zig # zig
        marketplace.jnoortheen.nix-ide # nix
        marketplace.tamasfe.even-better-toml # toml
        marketplace.redhat.vscode-yaml # yaml

        # auto completion
        #marketplace.github.copilot
        #marketplace.github.copilot-chat

        # theme
        marketplace.catppuccin.catppuccin-vsc
        marketplace.catppuccin.catppuccin-vsc-icons
        marketplace.enkia.tokyo-night
        marketplace.arcticicestudio.nord-visual-studio-code
        marketplace.mvllow.rose-pine

        # other
        marketplace.adpyke.codesnap # code screenshots
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
