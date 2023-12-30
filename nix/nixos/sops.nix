# sops
{ inputs, ... }:

{
  imports = [ inputs.sops.nixosModules.sops ];
}
