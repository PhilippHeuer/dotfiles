{ pkgs, pkgs-unstable, ... }:

{
  # plex service
  services.plex = {
    enable = true;
    openFirewall = true;
    user = "root"; # TODO: remove after permission issues are resolved
    extraPlugins = [
      (builtins.path {
        name = "Hama.bundle";
        path = pkgs.fetchFromGitHub {
          owner = "ZeroQI";
          repo = "Hama.bundle";
          rev = "daa43001bc1ced67aa2f90de8c61e5a1d109e862";
          sha256 = "sha256-tUzjbE4rNgocZFg9lCXBP9sAe/cPGInYj2P/RXvpbmM=";
        };
      })
    ];
    extraScanners = [
      (pkgs.fetchFromGitHub {
        owner = "ZeroQI";
        repo = "Absolute-Series-Scanner";
        rev = "048e8001a525ba1c04afda2aa2005feb74709eb8";
        sha256 = "sha256-RpZh69MaP+YnDJOTaERrbsL5o8Yy7OLZvYz+ejHOvcI=";
      })
    ];
    package = pkgs-unstable.plex;
    dataDir = "/var/lib/plex";
  };
}
