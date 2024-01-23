{ lib, ... }:

{
  # enable flatpak
  services.flatpak.enable = true;

  # add the flathub repository
  system.activationScripts.addFlatHubToFlatpak = lib.mkForce ''
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  '';
}
