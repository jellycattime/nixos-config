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
  # boot.blacklistedKernelModules = [ "tiny_power_button" ];
  programs.steam.enable = true;
  hardware.graphics.enable32Bit = true;
  services.envfs.enable = true;
  # boot.kernelParams = [ "usbcore.autosuspend=-1" ];
  # boot.kernelPackages = pkgs.linuxPackages_6_12;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [ "mem_sleep_default=deep" "usbcore.autosuspend=-1" ];

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