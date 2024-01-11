{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openshift # oc
  ];
}
