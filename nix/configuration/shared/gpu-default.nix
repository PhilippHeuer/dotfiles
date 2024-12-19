# nvidia gpu
#
{
  config,
  lib,
  pkgs,
  ...
}:

{
  # graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
