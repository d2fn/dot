{ config, pkgs, ... }:

{
  home.username = "d";
  home.homeDirectory = "/home/d";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
		jetbrains-toolbox
	];

	home.sessionVariables = {
		QT_QPA_PLATFORM = "wayland";
		OBSIDIAN_REST_API_KEY = "4709ff07a26d7ffa8c8c333ac7eeec969b89e4a3db258783767f29d6303a8126"
	};

  imports = [
    ../../hm/gtk.nix
		../../modules/focus_or_launch.nix
    ./hyprland.nix
    ./waybar.nix
  ];

}
