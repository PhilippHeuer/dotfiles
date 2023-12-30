# sops
{ lib, inputs, ... }:

{
  imports = [ inputs.sops.nixosModules.sops ];

  sops.defaultSopsFile = ../secrets/default.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = lib.mkDefault "/home/phx/dotfiles/config/sops/age/keys.txt";

  sops.secrets."user/phx/password" = lib.mkDefault {};
}
