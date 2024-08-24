{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    pkgs.mpd
    pkgs-unstable.rmpc # TODO: not available in stable
  ];

  services.mpd = {
    enable = true;
    musicDirectory = "/var/lib/mpd/music";
    extraConfig = ''
      # update library if files are added to musicDirectory
      auto_update "yes"

      # audio output
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };
}
