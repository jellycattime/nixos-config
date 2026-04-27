# modules/hardware.nix
{ config, pkgs, ... }:

{
  hardware.enableAllFirmware = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}