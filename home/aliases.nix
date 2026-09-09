# home/aliases.nix
{ ... }:

{
  home.shellAliases = {
    ll = "ls -la";
    k = "kubectl";
    
    # NixOS aliases
    nixos-rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    nixos-update = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    nixos-clean = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +2 && nix-env -p ~/.local/state/nix/profiles/home-manager --delete-generations +2 && sudo nix-collect-garbage && nix-collect-garbage";
    nixos-optimise = "sudo nix-store --optimise";
    nixos-diff = "nix store diff-closures /run/current-system /run/booted-system";

    # To upgrade to a new NixOS release:
    # 1. Edit /etc/nixos/flake.nix: bump nixpkgs.url and home-manager.url
    #    (e.g. nixos-25.11 -> nixos-26.05, release-25.11 -> release-26.05)
    # 2. cd /etc/nixos && sudo nix flake update
    # 3. Run nixos-rebuild (alias above) to apply
  };
}

#Инструкция: обновление GitHub token для NixOS
#1. Сгенерировать новый токен:
#https://github.com/settings/tokens
#(New personal access token -> classic, права можно не выбирать вообще, либо только public_repo, если репозиторий публичный - для nix flake update этого достаточно)
#2. Скопировать токен сразу после генерации (потом GitHub его не покажет).
#3. Прописать токен в конфиг root'а (важно, т.к. `nixos-update` идёт через sudo):
#sudo nano /root/.config/nix/nix.conf
#Строка должна выглядеть так:
#access-tokens = github.com=НОВЫЙ_ТОКЕН
#4. Отозвать старый токен на той же странице (https://github.com/settings/tokens), чтобы он не висел активным.
#5. Проверить, что всё работает:
#cd /etc/nixos && sudo nix flake lock --update-input home-manager
#6. Если ок - запускать обычный `nixos-update`.
