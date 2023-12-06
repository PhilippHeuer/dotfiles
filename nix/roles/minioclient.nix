{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    minio-client
  ];
}
