{
  default = {
    imports = [
      # core
      ./vm.nix
      ./ansible.nix
      ./base.nix
      ./gpg.nix

      # cli tools
      ./bat.nix
      ./fzf.nix
      ./sd.nix
      ./htop.nix
      ./btop.nix
      ./fastfetch.nix
      ./eza.nix
      ./zoxide.nix
      ./dotfiles.nix

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
    ];
  };
  # development tools
  development = {
    imports = [
      ./git.nix
      ./gitdelta.nix
      ./kondo.nix
      ./reposync.nix
      ./gh.nix
      ./lazygit.nix
      ./precommit.nix
      ./ripgrep.nix
      ./onefetch.nix
      ./just.nix

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
      ./alacritty.nix
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
