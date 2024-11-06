{
  default = {
    imports = [
      # core
      ./base.nix
      ./gpg.nix
      ./atuin.nix # replacement for the shell history
      ./development/git.nix

      # cli tools
      ./core/bat.nix # cat replacement
      ./core/fzf.nix # fuzzy finder
      ./core/sd.nix # sed alternative
      ./core/htop.nix # process monitor
      ./core/btop.nix # resource monitor
      ./core/fastfetch.nix # system info
      ./core/eza.nix # modern ls replacement
      ./core/zoxide.nix # modern cd replacement
      ./core/dotfiles.nix # dotfiles manager
      ./core/yazi.nix # terminal file manager
      ./core/just.nix # make alternative

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
  terminal = {
    imports = [
      ./terminal/alacritty.nix
      ./terminal/foot.nix
      ./terminal/kitty.nix
    ];
  };
  development = {
    imports = [
      ./development/git.nix # version control
      ./development/gitdelta.nix # git diff
      ./development/lazygit.nix # git tui
      ./development/precommit.nix # git hooks
      ./development/ripgrep.nix # search source code
      ./development/onefetch.nix # git summary
      ./development/kondo.nix # built output cleanup
      ./development/reposync.nix # sync git repos
      ./development/gh.nix # github cli
      ./development/dyff.nix # yaml diff
      ./development/tokei.nix # code statistics
      ./development/openapi.nix # openapi linter, changes, ...
      ./development/primecodegen.nix # code generator
      ./development/atac.nix # tui api client
      ./development/fuzzmux.nix
    ];
  };
  ide = {
    imports = [
      ./ide/neovim.nix # code editor
      ./ide/zed.nix # code editor
      ./ide/vscode.nix # code editor
      # ./ide/idea-community.nix # java ide
      ./ide/idea-ultimate.nix # java ide
      ./ide/goland.nix # java ide
      ./ide/dbeaver.nix # database client
      ./ide/bruno.nix # http client
    ];
  };
  lang = {
    imports = [
      ./lang/golang.nix
      ./lang/java.nix
      ./lang/nodejs.nix
      ./lang/python.nix
      ./lang/rust.nix
      ./lang/zig.nix
    ];
  };
  container = {
    imports = [
      ./container/podman.nix
    ];
  };
  admin = {
    imports = [
      ./admin/kubectl.nix
      ./admin/openshift.nix
      ./admin/k9s.nix
      ./admin/helm.nix
      ./admin/click.nix
      ./admin/usql.nix # universal sql client
      ./admin/kafkactl.nix # message brokers
      ./admin/minioclient.nix # s3
      ./admin/s3fs.nix # s3
      #./admin/vault.nix # vault
      ./admin/ansible.nix # playbook automation
      ./admin/ldap.nix # ldap client
    ];
  };
  communication = {
    imports = [
      ./communication/discord.nix
      ./communication/slack.nix
    ];
  };
  # streaming
  streaming = {
    imports = [
      ./streaming/obsstudio.nix # recording and broadcasting
      ./streaming/streamlink.nix # extract streams from various websites
      ./streaming/chatterino.nix # chat client
    ];
  };
  forensic = {
    imports = [
      #./forensic/autopsy.nix # digital forensics
      #./forensic/ghidra.nix # reverse engineering
      ./forensic/termshark.nix # tui for wireshark
      ./forensic/wireshark.nix # network protocol analyzer
    ];
  };
  games = {
    imports = [
      ./games/gamemode.nix # game mode
      ./games/steam.nix # game client
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
  desktop = {
    imports = [
      ./wallpapers.nix # wallpapers
      ./gtk.nix # theming
      ./gocheat.nix # cheat sheet for hotkeys
      ./browser/firefox.nix # web browser
      ./browser/librewolf.nix # web browser
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
  # drive monitoring
  drivemonitoring = {
    imports = [
      ./driveguard.nix # private, experimental code
    ];
  };
}
