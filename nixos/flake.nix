{
	description = "NixOS Config";

	inputs = {
			nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
	};
	
	outputs = { self, nixpkgs, ... }: {
		nixosConfigurations = {
			t480 = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./base.nix
					./t480-hardware-configuration.nix
					./home/configuration.nix
					./home/git.nix
				];
			};
			nflx = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./base.nix
					./p16s-hardware-configuration.nix
					./nflx/configuration.nix
					./nflx/git.nix
					./nflx/code.nix
					./nflx/nix-ld.nix
				];
			};
		};
	};
}
