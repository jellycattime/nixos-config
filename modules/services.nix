{ config, pkgs, ... }:

{
  services.openssh.enable = true;

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
    enableOnBoot = true;
  };
}