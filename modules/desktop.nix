# modules/desktop.nix
{ config, pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
  };
  services.desktopManager.plasma6.enable = true;
  services.xserver.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.enableRedistributableFirmware = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.libinput.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}