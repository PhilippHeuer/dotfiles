{
  pkgs,
  lib,
  config,
  ...
}:

{
  sops.secrets."mopidy/jellyfin" = lib.mkDefault {
    sopsFile = ../../secrets/mopidy.yaml;
    restartUnits = [ "mopidy.service" ];
    owner = "mopidy";
  };

  # extensible music server that plays music from local disk, Spotify, SoundCloud, and more
  services.mopidy = {
    enable = true;
    extensionPackages = [
      pkgs.mopidy-iris # web client
      pkgs.mopidy-mpd # playback from mpd clients
      pkgs.mopidy-jellyfin # source: jellyfin libraries
    ];
    configuration = ''
      [http]
      enabled = true
      hostname = 127.0.0.1
      port = 6680
      allowed_origins =
      csrf_protection = true
      default_app = iris

      [iris]
      enabled = true
      country = de
      locale = en_US

      [mpd]
      enabled = true
      hostname = 0.0.0.0

      [audio]
      output = audioresample ! audioconvert ! audio/x-raw,rate=48000,channels=2,format=S16LE ! pulsesink client-name=mopidy server=tcp:127.0.0.1:4713
    '';
    # pipewire audio output
    # output = audioresample ! audioconvert ! audio/x-raw,rate=48000,channels=2,format=S16LE ! wavenc ! filesink location=/run/snapserver/pipewire
    extraConfigFiles = [ config.sops.secrets."mopidy/jellyfin".path ];
  };

  # firewall, 6600 = mpd daemon, 6680 = iris web ui
  # networking.firewall.allowedTCPPorts = [ 6600 6680 ];
}
