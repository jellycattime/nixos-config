# flake.nix
{
  description = "NixOS config";

  inputs = {
    # hermes-agent.url = "github:NousResearch/hermes-agent";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    artcraft.url = "github:ipeglin/artcraft-nix";

    #niri
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  # outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, hermes-agent, ... }: {
  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, artcraft, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit nixpkgs-unstable inputs; };
      modules = [
        ./configuration.nix
        inputs.niri.nixosModules.niri
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.sharedModules = [ inputs.noctalia.homeModules.default ];
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