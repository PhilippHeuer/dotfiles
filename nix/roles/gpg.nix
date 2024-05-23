{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnupg
    pinentry-curses
  ];

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
}
