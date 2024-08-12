{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.git
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
  };
}
