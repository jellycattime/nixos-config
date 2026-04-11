{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "max";
      user.email = "maxim22ananin@gmail.com";
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      k = "kubectl";

      # NixOS aliases
      nixos-rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      nixos-update = "sudo nixos-rebuild switch --upgrade --flake /etc/nixos#nixos";
      nixos-clean = "sudo nix-collect-garbage -d";
      nixos-optimise = "sudo nix-store --optimise";
      nixos-diff = "nix store diff-closures /run/current-system /run/booted-system";
    };
  };
}