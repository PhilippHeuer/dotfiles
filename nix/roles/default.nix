{
  default = {
    imports = [
      # core
      ./vm.nix
      ./ansible.nix
      ./base.nix
      ./gpg.nix

      # cli tools
      ./bat.nix # cat replacement
      ./fzf.nix # fuzzy finder
      ./sd.nix # sed alternative
      ./htop.nix # process monitor
      ./btop.nix # resource monitor
      ./fastfetch.nix # system info
      ./eza.nix # modern ls replacement
      ./zoxide.nix # modern cd replacement
      ./dotfiles.nix # dotfiles manager
      ./yazi.nix # terminal file manager

      # ssh
      ./ssh.nix

      # terminal
      ./tmux.nix
      ./zellij.nix
      ./nushell.nix
      ./starship.nix

      # editor
      ./neovim.nix
      ./fuzzmux.nix

      # secret management
      ./sops.nix
      ./vault.nix
      ./yubikey.nix

      # k8s
      ./podman.nix
      ./kubectl.nix
      ./openshift.nix
      ./k9s.nix
      ./helm.nix
      ./click.nix

      # s3
      ./minioclient.nix
      ./s3fs.nix

      # appimage
      ./appimage.nix
    ];
  };
  # development tools
  development = {
    imports = [
      ./git.nix # version control
      ./gitdelta.nix # git diff
      ./lazygit.nix # git ui
      ./precommit.nix # git hooks
      ./ripgrep.nix # search source code
      ./onefetch.nix # git summary
      ./just.nix # make alternative
      ./kondo.nix # built output cleanup
      ./reposync.nix # sync git repos
      ./gh.nix # github cli

      # http client
      ./bruno.nix

      # language toolchains
      ./java.nix
      ./nodejs.nix
      ./python.nix
      ./golang.nix
    ];
  };
  wm-sway = {
    imports = [
      ./wm.nix
      ./wm-sway.nix
      ./nwg-panel.nix
    ];
  };
  wm-hyprland = {
    imports = [
      ./wm.nix
      ./wm-hyprland.nix
      ./nwg-panel.nix
    ];
  };
  desktop = {
    imports = [
      ./gtk.nix # theming
      ./alacritty.nix # terminal
      ./kitty.nix # terminal
      ./rofi.nix
      ./nemo.nix # file manager
      ./firefox.nix
      ./silicon.nix # create beautiful images of source code
      ./albert.nix # minimal launcher
      
    ];
  };
  ide = {
    imports = [
      ./dbeaver.nix # database client
      ./vscode.nix # code editor
      ./idea-community.nix # java ide
    ];
  };
  media = {
    imports = [
      ./mpv.nix # video player
      ./mpvpaper.nix # video wallpaper
      ./sxiv.nix # image viewer
    ];
  };
}
