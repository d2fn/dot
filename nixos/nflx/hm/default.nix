{ config, pkgs, ... }:

{

	programs.home-manager.enable = true;

	home = {
		username = "d";
		homeDirectory = "/home/d";
		stateVersion = "25.05";
		sessionVariables = {
			QT_QPA_PLATFORM = "wayland";
			OBSIDIAN_REST_API_KEY = "4709ff07a26d7ffa8c8c333ac7eeec969b89e4a3db258783767f29d6303a8126";
		};
		packages = with pkgs; [
			jetbrains-toolbox
		];
	};

	imports = [
		../../hm/gtk.nix
		../../modules/focus_or_launch.nix
		./digikam.nix
		./hyprland.nix
		./waybar.nix
	];

}
