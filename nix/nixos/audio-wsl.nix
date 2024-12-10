{ pkgs, lib, ... }:

let
  pulseProxyCommand = "${pkgs.socat}/bin/socat TCP-LISTEN:4713,reuseaddr,fork UNIX-CONNECT:/mnt/wslg/PulseServer";
in
{
  # wsl uses pulseaudio as of now
  hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;
  services.pipewire.enable = false;

  # tcp to unix socket proxy for pulseaudio
  systemd.services.pulseSocketProxy = {
    description = "Proxy PulseAudio TCP to UNIX socket";
    serviceConfig = {
      ExecStart = "${pulseProxyCommand}";
      Restart = "always";
    };
    wantedBy = [ "multi-user.target" ];
  };
  environment.variables.PULSE_SERVER = "tcp:127.0.0.1:4713";
  environment.systemPackages = [ pkgs.socat ];
}
