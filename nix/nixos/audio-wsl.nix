{ pkgs, lib, ... }:

{
  # wsl uses pulseaudio as of now
  hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;
  services.pipewire.enable = false;

  # set pulseaudio socket for mpd
  services.mpd = {
    extraConfig = ''
      # audio output
      audio_output {
        type "pulse"
        name "Pulseaudio"
        server "unix:/mnt/wslg/PulseServer"
        # format "44100:16:2"
      }
    '';
  };
}
