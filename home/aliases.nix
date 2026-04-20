# home/aliases.nix
{ ... }:

{
  home.shellAliases = {
    ll = "ls -la";
    k = "kubectl";
    
    # NixOS aliases
    nixos-rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    nixos-update = "sudo nixos-rebuild switch --upgrade --flake /etc/nixos#nixos";
    nixos-clean = "sudo nix-collect-garbage -d";
    nixos-optimise = "sudo nix-store --optimise";
    nixos-diff = "nix store diff-closures /run/current-system /run/booted-system";
  };
}
