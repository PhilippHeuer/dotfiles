{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.git
    pkgs.git-filter-repo
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
  };
}
