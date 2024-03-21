{
  default = {
    imports = [
      ./base.nix
      ./pullsecrets.nix
      ./sops.nix
      ./locale.nix
      ./fonts.nix
      ./nixconfig.nix
      ./telemetry.nix
    ];
  };
}
