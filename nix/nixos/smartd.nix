{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.smartmontools
  ];

  services.smartd = {
    enable = true;
    autodetect = true; # monitor all devices connected when the machine is booted
    extraOptions = [ "--interval=7200" ]; # check every 2 hours
  };
}
