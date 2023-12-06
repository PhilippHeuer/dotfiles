# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # nix cli options
  nix.settings.experimental-features = "nix-command flakes";

  ## wsl mount configuration
  #wsl.wslConf.automount.enable = true;
  #wsl.wslConf.automount.mountFsTab = true;
  #wsl.wslConf.automount.root = "/mnt";
  #wsl.wslConf.automount.options = "metadata,uid=1000,gid=1000,umask=022,fmask=111,case=off";

  # wsl
  wsl.enable = true;
  wsl.defaultUser = "nixos";

  # wsl interop configuration
  wsl.interop.register = false;
  wsl.interop.includePath = false;

  # install
  environment.systemPackages = with pkgs; [
    # base configuration
    virt-what # role: vm
     #   - role: ansible       # ansible configuration
 #   - role: binfmt        # binfmt support
 #   - role: base          # basic distro configuration
 #   - role: fonts         # fonts
    (import ./packages/dotfilescli.nix) # role: dotfilescli
    # ssh
    # ssh
    # core tools
    bat # role: bat
    fzf # role: fzf
    sd # role: sd
    htop # role: htop
    btop # role: btop
    fastfetch # role: fastfetch
    eza # role: eza
    zoxide # role: zoxide
    # terminal
    tmux # role: tmux
    zellij # role: zellij
    nushell # role: nushell
    starship # role: starship
    # editor
    neovim # role: neovim
    # fuzzmux # role: fuzzmux
    # language toolchains
    temurin-bin-21 # role: java
    nodejs_21 # role: nodejs
    python312 # role: python
    go # role: golang
    # development tools
    git # role: git
    delta # role: gitdelta
    kondo # role: kondo
    # reposync # role: reposync
    gh # role: gh
    lazygit # role: lazygit
    pre-commit # role: precommit
    ripgrep # role: ripgrep
    # ops
    kubectl # role: kubectl
    k9s # role: k9s
    helm # role: helm
    minio-client # role: minioclient
    click # role: click
    s3fs # role: s3fs
    # desktop
    xwayland # role: wayland
    # desktop - terminal emulator (choose one)
    alacritty # role: alacritty
    # desktop - window manager (choose one)
    sway # role: sway
    hyprland # role: hyprland
    # desktop - apps
    rofi # role: rofi
    xfce.thunar # role: thunar
    sxiv # role: sxiv
    firefox # role: firefox


    xdg-utils # for opening default programs when clicking links
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
  ];

  system.activationScripts.postActivate = ''
    ${pkgs.bat}/bin/bat cache --build
  '';
}
