# nvidia gpu
#
{ config, lib, pkgs, ... }:

{
  # amd kernel module
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware.opengl = {
    extraPackages = with pkgs; [ rocm-opencl-icd rocm-opencl-runtime amdvlk ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };
}
