# modules/desktop.nix
{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.libinput.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}