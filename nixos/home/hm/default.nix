{ config, pkgs, ... }:

{
  home.username = "d";
  home.homeDirectory = "/home/d";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

	home.sessionVariables = {
		QT_QPA_PLATFORM = "wayland";
	};

  imports = [
    ../../hm/gtk.nix
		../../modules/focus_or_launch.nix
    ./hyprland.nix
    ./waybar.nix
  ];

}
