{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    kondo
  ];
}
