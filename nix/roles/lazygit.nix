{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    lazygit
  ];
}
