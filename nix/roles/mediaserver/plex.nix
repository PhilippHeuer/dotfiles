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
        rev = "6145eec212be2b21004f2eea52cff9840ea2646b";
        sha256 = "sha256-Hi4fhIlbEhpOy5QLMW5hsWLBnoXnhAsJWJ+x2iTYe9Q=";
      })
    ];
    package = pkgs-unstable.plex;
    dataDir = "/var/lib/plex";
  };
}
