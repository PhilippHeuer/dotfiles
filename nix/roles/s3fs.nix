{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    s3fs
  ];
}
