# nvidia gpu
#
{
  config,
  lib,
  pkgs,
  ...
}:

{
  # opengl
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # for 24.11+
  #hardware.graphics = {
  #  enable = true;
  #  enable32Bit = true;
  #};
}
