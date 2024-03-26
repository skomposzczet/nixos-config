{

  description = "Cool flake";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    skomposzczet-nvim.url = "github:skomposzczet/nixvim-config";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: 
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      hyperion = lib.nixosSystem {
        modules = [ 
          ./hosts/hyperion/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = { inherit inputs system; };
            home-manager.users.d3rfnam = import ./home/d3rfnam/home.nix;
          }
        ];
      };
    };
  };

}
