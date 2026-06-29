# home/aliases.nix
{ ... }:

{
  home.shellAliases = {
    ll = "ls -la";
    k = "kubectl";
    
    # NixOS aliases
    nixos-rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    nixos-update = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    nixos-clean = "sudo nix-collect-garbage -d";
    nixos-optimise = "sudo nix-store --optimise";
    nixos-diff = "nix store diff-closures /run/current-system /run/booted-system";

    # To upgrade to a new NixOS release:
    # 1. Edit /etc/nixos/flake.nix: bump nixpkgs.url and home-manager.url
    #    (e.g. nixos-25.11 -> nixos-26.05, release-25.11 -> release-26.05)
    # 2. cd /etc/nixos && sudo nix flake update
    # 3. Run nixos-rebuild (alias above) to apply
  };
}
