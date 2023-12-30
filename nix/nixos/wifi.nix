# network configuration
{ lib, ... }:

{
  sops.secrets."networkmanager/wifi/home" = lib.mkDefault {
    sopsFile = ../secrets/wifi.yaml;
    path = "/etc/NetworkManager/system-connections/HOME.nmconnection";
  };
}
