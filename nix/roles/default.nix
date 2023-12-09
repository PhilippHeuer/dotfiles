{
  default = {
    imports = [
      # core
      ./vm.nix
      ./ansible.nix
      ./base.nix
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
      # fuzzmux # role: fuzzmux

      # language toolchains
      ./java.nix
      ./nodejs.nix
      ./python.nix
      ./golang.nix

      # development tools
      ./git.nix
      ./gitdelta.nix
      ./kondo.nix
      ./reposync.nix
      ./gh.nix
      ./lazygit.nix
      ./precommit.nix
      ./ripgrep.nix
      ./onefetch.nix

      # k8s
      ./kubectl.nix
      ./k9s.nix
      ./helm.nix
      ./click.nix

      # s3
      ./minioclient.nix
      ./s3fs.nix
    ];
  };
  wm = {
    imports = [
      ./wayland.nix
    ];
  };
  wm-sway = {
    imports = [
      ./sway.nix
    ];
  };
  wm-hyprland = {
    imports = [
      ./hyprland.nix
    ];
  };
  desktop = {
    imports = [
      ./alacritty.nix
      ./rofi.nix
      ./thunar.nix
      ./sxiv.nix
    ];
  };
}
