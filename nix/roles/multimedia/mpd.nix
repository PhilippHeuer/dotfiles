{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.mpd
  ];

  services.mpd = {
    enable = true;
    musicDirectory = "/var/lib/mpd/music";
    extraConfig = ''
      # update library if files are added to musicDirectory
      auto_update "yes"
      auto_update_depth "5"

      # logging
      log_level "warning"

      # put mpd in paused mode after startup
      restore_paused "yes"

      # follow symlinks (including outside of musicDirectory)
      follow_outside_symlinks "yes"
      follow_inside_symlinks "yes"

      # audio output
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };
}
