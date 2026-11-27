# modules/cosmic.nix
{ lib, pkgs, nixpkgs-unstable, ... }:

{
  # COSMIC целиком из nixpkgs-unstable
  nixpkgs.overlays = [
    (_final: prev:
      let
        unstable = import nixpkgs-unstable {
          system = prev.stdenv.hostPlatform.system;
          config.allowUnfree = true;
        };
      in
      lib.filterAttrs (n: _: lib.hasPrefix "cosmic-" n && n != "cosmic-applibrary") unstable
      // {
        cosmic-applibrary = unstable.cosmic-app-library;
        xdg-desktop-portal-cosmic = unstable.xdg-desktop-portal-cosmic;
      })
  ];

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  # компоненты, которых ещё нет в списке модуля 26.05
  environment.systemPackages = with pkgs; [
    cosmic-osk
    cosmic-monitor
    cosmic-viewer
    cosmic-sound-theme
    xrdb
  ];

  # COSMIC включает gnome-keyring, а его gcr-агент конфликтует с programs.ssh.startAgent
  services.gnome.gcr-ssh-agent.enable = false;
}
