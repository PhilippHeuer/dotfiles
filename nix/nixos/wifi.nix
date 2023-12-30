### network connections
{ lib, config, ... }:

{
  environment.etc."NetworkManager/system-connections/HOME.nmconnection".text = lib.mkForce ''
# requires SOPS or other encryption
'';
}
