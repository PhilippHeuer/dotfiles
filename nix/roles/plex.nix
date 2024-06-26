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
          rev = "bb684a2299d06b1377b4d3e1c81dff417ce4e9de";
          sha256 = "sha256-PtW8I2iloD3SohPPo12zDSsFg9rskNj1W15bg0DA/BY=";
        };
      })
    ];
    extraScanners = [
      (pkgs.fetchFromGitHub {
        owner = "ZeroQI";
        repo = "Absolute-Series-Scanner";
        rev = "c5e3db9bdbcf373667afd5177834907a0d136313";
        sha256 = "sha256-RpZh69MaP+YnDJOTaERrbsL5o8Yy7OLZvYz+ejHOvcI=";
      })
    ];
    package = pkgs-unstable.plex;
    dataDir = "/var/lib/plex";
  };
}
