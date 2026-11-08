# flake.nix
{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    # hermes-agent.url = "github:NousResearch/hermes-agent";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    artcraft.url = "github:ipeglin/artcraft-nix";
  };

  # outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, hermes-agent, ... }: {
  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, artcraft, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit nixpkgs-unstable; };
      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          # home-manager.sharedModules = [ hermes-agent.homeManagerModules.default ];
          home-manager.users.max = import ./home/home.nix;
        }

        artcraft.nixosModules.default

        {
          programs.artcraft = {
            enable = true;
            apps = [ "filmcraft" ];
          };
        }
      ];
    };
  };
}