{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vpnManager = {
      url = "path:/home/d/git/vpn-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      vpnManager,
      dms,
      dgop,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {

      nixosConfigurations = {
        adf-shop-pc = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit home-manager;
          };
          modules = [
            ./hosts/adf-shop-pc
          ];
        };

        adf-t480 = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/adf-t480
          ];
        };

        adf-x220 = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit home-manager;
          };
          modules = [
            ./hosts/adf-x220
          ];
        };

        nflx = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit home-manager vpnManager;
          };
          modules = [
            ./hosts/nflx-dfeatherston-p16s
          ];
        };

      };
    };
}
