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
  virtualisation.oci-containers.backend = "podman";

  environment.systemPackages = [
    pkgs.rootlesskit
    pkgs-unstable.buildkit
    pkgs-unstable.dive # inspect image layers
    pkgs-unstable.skopeo # various operations on container images and image repositories
  ];
}
