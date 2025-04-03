{
  # core tooling
  default = {
    imports = [
      # core
      ./base.nix
      ./core/gpg.nix
      ./core/atuin.nix # replacement for the shell history
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
      ./core/ssh.nix
      ./core/sshfs.nix

      # terminal shell
      ./shell/bash.nix # default shell
      ./shell/nushell.nix # mocern cross-platform shell

      # terminal multiplexer
      ./core/tmux.nix
      # ./core/zellij.nix

      # terminal prompt
      ./shell/starship.nix # customizable prompt for any shell

      # secret management (required)
      ./secretmanagement/sops.nix
      ./secretmanagement/yubikey.nix

      # package formats
      ./packageformat/appimage.nix
    ];
  };
  # terminal emulators
  terminal = {
    imports = [
      ./terminal/alacritty.nix
      ./terminal/foot.nix
      #./terminal/ghostty.nix
      ./terminal/kitty.nix
    ];
  };
  # security
  security = {
    imports = [
      ./security/apparmor.nix
      ./security/clamav.nix
      ./security/fail2ban.nix
      ./security/firejail.nix
    ];
  };
  # secret management
  secretmanagement = {
    imports = [
      ./secretmanagement/pass.nix # command-line password manager
      ./secretmanagement/keepassxc.nix # graphical password manager
      ./secretmanagement/sops.nix # secrets encryption
      ./secretmanagement/yubikey.nix # hardware security key
    ];
  };
  # container runtime
  container = {
    imports = [
      ./container/podman.nix
    ];
  };

  # development tools
  development = {
    imports = [
      ./development/git.nix # version control
      ./development/gitdelta.nix # git diff
      ./development/lazygit.nix # git tui
      ./development/precommit.nix # git hooks
      ./development/direnv.nix # dir based env hooks
      ./development/devenv.nix # reproducible development environment
      ./development/ripgrep.nix # search source code
      ./development/onefetch.nix # git summary
      ./development/kondo.nix # built output cleanup
      ./development/reposync.nix # sync git repos
      ./development/gh.nix # github cli
      ./development/dyff.nix # yaml diff
      ./development/tokei.nix # code statistics
      ./development/openapi.nix # openapi linter, changes, ...
      ./development/primecodegen.nix # code generator
      ./development/openapi-generator.nix # code generator
      ./development/speakeasy.nix # speakeasy
      ./development/atac.nix # tui api client
      ./development/fuzzmux.nix
      ./development/silicon.nix # create beautiful images of source code
      ./development/cid.nix # ci cd tool
      ./development/oras.nix # oci registry as storage
      ./development/syft.nix # software bill of materials
      ./development/qodana.nix # code quality
      ./development/upx.nix # executable packer
    ];
  };
  # code editors
  ide = {
    imports = [
      ./ide/neovim.nix # code editor
      ./ide/zed.nix # code editor
      ./ide/vscode.nix # code editor
      ./ide/idea-community.nix # java ide
      ./ide/idea-ultimate.nix # java ide
      ./ide/goland.nix # java ide
      ./ide/dbeaver.nix # database client
      #./ide/bruno.nix # http client
    ];
  };
  # language toolchains
  lang = {
    imports = [
      ./lang/dotnet.nix
      ./lang/golang.nix
      ./lang/java.nix
      ./lang/nodejs.nix
      ./lang/python.nix
      ./lang/rust.nix
      ./lang/zig.nix
    ];
  };
  # admin tools
  admin = {
    imports = [
      ./admin/kubectl.nix
      ./admin/kubecolor.nix
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
      ./admin/rundeck.nix # rundeck runbook automation
      ./admin/rcon.nix # rcon console for various games
      ./admin/restish.nix # http client
      ./admin/oauth2c.nix # oauth2 client
    ];
  };

  # communication and collaboration
  communication = {
    imports = [
      ./communication/discord.nix
      ./communication/slack.nix
    ];
  };

  # forensic
  forensic = {
    imports = [
      #./forensic/autopsy.nix # digital forensics
      #./forensic/ghidra.nix # reverse engineering
      ./forensic/termshark.nix # tui for wireshark
      ./forensic/wireshark.nix # network protocol analyzer
    ];
  };
  # multimedia
  multimedia = {
    imports = [
      ./multimedia/playerctl.nix # music player
      #./multimedia/mpd.nix # local music player
      ./multimedia/mopidy.nix # music player
      ./multimedia/rmpc.nix # terminal client for mpd
      ./multimedia/mpv.nix # video player
      ./multimedia/mpvpaper.nix # video wallpaper
      ./multimedia/sxiv.nix # image viewer
    ];
  };
  # gaming
  games = {
    imports = [
      ./games/gamemode.nix # game mode
      ./games/steam.nix # game client
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

  # home automation
  homeautomation = {
    imports = [
      ./homeautomation/pihole.nix # network-wide dns blocker
      #./homeautomation/blocky.nix # network-wide dns blocker
      ./homeautomation/homeassistant.nix # home automation
    ];
  };
  # media server
  mediaserver = {
    imports = [
      ./mediaserver/plex.nix # media server
      ./mediaserver/jellyfin.nix # media server
      ./mediaserver/komga.nix # ebook server
      ./mediaserver/samba.nix # file server
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
      ./browser/chrome.nix # web browser
      ./browser/floorp.nix # web browser
      ./rofi.nix
      ./nemo.nix # file manager
      #./albert.nix # minimal launcher
      ./ags.nix # gtk shell / widget library
      ./misc/hellwal.nix # color palette generator
    ];
  };
  # cryptography
  driveencryption = {
    imports = [
      ./cryptography/veracrypt.nix
    ];
  };
  drivemonitoring = {
    imports = [
      ./driveguard.nix # private, experimental code
    ];
  };
}
