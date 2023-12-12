{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    xwayland
  ];
}
