# configuration.nix
{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/hardware.nix
    ./modules/desktop.nix
    ./modules/services.nix
    ./modules/packages.nix
    ./modules/users.nix
    ./modules/nix.nix
    ./modules/kde-themes.nix
  ];

  networking.hostName = "nixos";
  time.timeZone = "Asia/Yerevan";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  swapDevices = [{
    device = "/swapfile";
    size = 8192;
  }];

  boot.kernel.sysctl = {
      "vm.swappiness" = 100;
      "vm.vfs_cache_pressure" = 200;
  };

  networking.networkmanager.enable = true;

  system.stateVersion = "25.11";
}