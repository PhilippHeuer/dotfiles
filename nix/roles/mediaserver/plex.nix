{ pkgs, pkgs-unstable, ... }:

{
  # plex service
  services.plex = {
    enable = true;
    openFirewall = true;
    user = "phx"; # needed to access mounted media
    extraPlugins = [
      (builtins.path {
        name = "Hama.bundle";
        path = pkgs.fetchFromGitHub {
          owner = "ZeroQI";
          repo = "Hama.bundle";
          rev = "fb6a5689359c6630c0fcfec58f8e3533497fd977";
          sha256 = "sha256-6xFYCg4wP1ZARKgOPxMZQlt4yHei9FwvqXI1fVHg1NA=";
        };
      })
    ];
    extraScanners = [
      (pkgs.fetchFromGitHub {
        owner = "ZeroQI";
        repo = "Absolute-Series-Scanner";
        rev = "33ce1de7199918371eff75e894d35d52bb9a6f30";
        sha256 = "sha256-dqcAGAFPps0Hd18j54FTPGVH8KK0iYBfpI4Q3qRT+H0=";
      })
    ];
    package = pkgs-unstable.plex;
    dataDir = "/var/lib/plex";
  };
}
