{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vpnManager = {
      url = "path:/home/d/git/vpn-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      vpnManager,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {

      nixosConfigurations = {
        adf-t480 = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit home-manager;
          };
          modules = [
            ./hosts/adf-t480
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
