{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    bat
  ];

  system.activationScripts.postActivate = ''
    ${pkgs.bat}/bin/bat cache --build
  '';
}
