{
  default = {
    imports = [
      # core
      ./vm.nix
      ./ansible.nix
      ./base.nix
      ./gpg.nix
      ./atuin.nix # replacement for the shell history
      ./git.nix # version control

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
      ./sshfs.nix

      # terminal
      ./tmux.nix
      # ./zellij.nix
      ./nushell.nix
      ./starship.nix

      # secret management
      ./sops.nix
      ./yubikey.nix

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
      ./dyff.nix # yaml diff
      ./tokei.nix # code statistics
      ./openapi.nix # openapi linter, changes, ...
      ./primecodegen.nix # code generator
      ./atac.nix # tui api client

      # editor
      ./neovim.nix
      ./fuzzmux.nix
    ];
  };
  language-toolchains = {
    imports = [
      ./java.nix
      ./nodejs.nix
      ./python.nix
      ./golang.nix
      ./rust.nix
      ./zig.nix
    ];
  };
  # forensic
  forensic = {
    imports = [
      ./termshark.nix
    ];
  };
  # container runtime
  container-runtime = {
    imports = [
      ./podman.nix
    ];
  };
  # administration tools
  administration-tools = {
    imports = [
      # k8s
      ./kubectl.nix
      ./openshift.nix
      ./k9s.nix
      ./helm.nix
      ./click.nix

      # database
      ./usql.nix # universal sql client

      # message brokers
      ./kafkactl.nix

      # s3
      ./minioclient.nix
      ./s3fs.nix

      # vault
      ./vault.nix
    ];
  };
  # desktop environment
  wm-sway = {
    imports = [
      ./wm.nix
      ./wm-sway.nix
      ./wm-waybar.nix
      ./clipboard.nix
    ];
  };
  wm-hyprland = {
    imports = [
      ./wm.nix
      ./wm-hyprland.nix
      ./wm-waybar.nix
      ./clipboard.nix
    ];
  };
  terminal = {
    imports = [
      ./terminal-alacritty.nix
      ./terminal-foot.nix
      ./terminal-kitty.nix
    ];
  };
  desktop = {
    imports = [
      ./wallpapers.nix # wallpapers
      ./gtk.nix # theming
      ./browser-firefox.nix # web browser
      ./browser-librewolf.nix # web browser
      ./rofi.nix
      ./nemo.nix # file manager
      ./silicon.nix # create beautiful images of source code
      ./albert.nix # minimal launcher
      ./keepassxc.nix # password manager
      ./playerctl.nix # music player
      ./mpd.nix # music player
      ./mpv.nix # video player
      ./mpvpaper.nix # video wallpaper
      ./sxiv.nix # image viewer
      ./ags.nix # gtk shell / widget library
    ];
  };
  ide = {
    imports = [
      ./ide-vscode.nix # code editor
      # ./ide-idea-community.nix # java ide
      ./ide-idea-ultimate.nix # java ide
      ./ide-goland.nix # java ide
      ./ide-zed.nix # zed editor
      ./dbeaver.nix # database client
      ./bruno.nix # http client
    ];
  };
  # home network
  homeautomation = {
    imports = [
      ./homeassistant.nix
      ./pihole.nix
    ];
  };
  # media server
  mediaserver = {
    imports = [
      ./plex.nix
      ./komga.nix
    ];
  };
  # vpn
  vpn = {
    imports = [
      ./protonvpn.nix
    ];
  };
  # games
  games = {
    imports = [
      ./steam.nix
    ];
  };
  # drive encryption
  driveencryption = {
    imports = [
      ./veracrypt.nix
    ];
  };
  # drive monitoring
  drivemonitoring = {
    imports = [
      ./driveguard.nix # private, experimental code
    ];
  };
}
