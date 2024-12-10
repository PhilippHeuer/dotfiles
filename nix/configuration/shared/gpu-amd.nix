# nvidia gpu
#
{
  config,
  lib,
  pkgs,
  ...
}:

{
  # amd kernel module
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware.graphics.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
    amdvlk
  ];
  hardware.graphics.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
}
