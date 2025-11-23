{ config, pkgs, ... }:

{
	home.username = "d";
	home.homeDirectory = "/home/d";
	home.stateVersion = "25.05";

	programs.home-manager.enable = true;

  # udiskie is user-level automounter
  services.udiskie = {
    enable = true;
    # these are actually the defaults, but being explicit is nice:
    automount = true;
    notify = true;
    tray = "auto";
  };

	home.sessionVariables = {
		QT_QPA_PLATFORM = "wayland";
		OBSIDIAN_REST_API_KEY = "890170f6ef90e5c9cd2be20746cb55d2a84e43b23467f54ed2005f25e79f5df2";
	};

	home.packages = with pkgs; [
		mpv
		celluloid
	];

	imports = [
		../../hm/gtk.nix
		../../modules/focus_or_launch.nix
		./dropbox.nix
		./hyprland.nix
		./waybar.nix
	];

}
