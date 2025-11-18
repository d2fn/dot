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
					./home/greetd.nix
				];
			};
			nflx = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./base.nix
					./p16s-hardware-configuration.nix
					./nflx/code.nix
					./nflx/configuration.nix
					./nflx/git.nix
					./nflx/gnome.nix
					./nflx/nix-ld.nix
					./nflx/packages.nix
					./nflx/slack.nix
				];
			};
		};
	};
}
