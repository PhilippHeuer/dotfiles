{ pkgs, pkgs-unstable, ... }:

{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;

    autoPrune = {
      enable = true;
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

  environment.variables = {
    PODMAN_IGNORE_CGROUPSV1_WARNING = "true"; # suppress warning about cgroup v1
  };
}
