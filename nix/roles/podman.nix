{ pkgs, pkgs-unstable, ... }:

{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;

    autoPrune = {
      enable = true;
      flags = [ "--keep-tag-revisions=5" ];
      dates = "weekly";
    };
  };
}
