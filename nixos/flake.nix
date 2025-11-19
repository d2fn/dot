{
	description = "NixOS Config";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	
	outputs = { self, nixpkgs, home-manager, ... }:
		let system = "x86_64-linux";
	in {
		nixosConfigurations = {
			t480 = nixpkgs.lib.nixosSystem {
				inherit system;
				modules = [
					./base.nix
					./t480-hardware-configuration.nix
					./home/configuration.nix
					./home/git.nix
					./home/greetd.nix
					./modules/bin-symlinks.nix
					./modules/code.nix
					./modules/core-packages.nix
					./modules/fonts.nix
					./modules/reverse-eng.nix
					./modules/zsa.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.d = import ./home/hm;
					}
				];
			};
			nflx = nixpkgs.lib.nixosSystem {
				inherit system;
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
					./modules/bin-symlinks.nix
					./modules/code.nix
					./modules/core-packages.nix
					./modules/fonts.nix
					./modules/hyprland.nix
					./modules/reverse-eng.nix
					./modules/zsa.nix
				];
			};
		};
	};
}
