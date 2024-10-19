{ pkgs, ... }:

{
  # steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    # https://www.reddit.com/r/NixOS/comments/1bcsud4/some_steam_games_will_not_launch_on_nixos_but_on/
    package = pkgs.steam.override {
      extraPkgs = (
        pkgs: with pkgs; [
          pango
          harfbuzz

          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils

          mangohud # system stats
        ]
      );
      extraEnv = {
        MANGOHUD = true;
        OBS_VKCAPTURE = true;
      };
    };
  };
}
