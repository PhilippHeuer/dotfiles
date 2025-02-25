{
  self,
  inputs,
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.openapi-generator-cli
  ];
}
