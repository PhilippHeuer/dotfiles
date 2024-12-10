{
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.rmpc
  ];
}
