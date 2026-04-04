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
  ];

  networking.hostName = "nixos";
  time.timeZone = "Asia/Yerevan";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  swapDevices = [{
    device = "/swapfile";
    size = 8192;
  }];

  networking.networkmanager.enable = true;

  system.stateVersion = "25.11";
}