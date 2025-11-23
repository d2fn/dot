{ config, pkgs, ... }:

{
	programs.home-manager.enable = true;

	home = {
		username = "d";
		homeDirectory = "/home/d";
		stateVersion = "25.05";
		sessionVariables = {
			QT_QPA_PLATFORM = "wayland";
			OBSIDIAN_REST_API_KEY = "890170f6ef90e5c9cd2be20746cb55d2a84e43b23467f54ed2005f25e79f5df2";
		};
		packages = with pkgs; [
			mpv
			celluloid
		];
	};

  # udiskie is user-level automounter
  services.udiskie = {
    enable = true;
    # these are actually the defaults, but being explicit is nice:
    automount = true;
    notify = true;
    tray = "auto";
  };

	imports = [
		../../hm/gtk.nix
		../../modules/focus_or_launch.nix
		./dropbox.nix
		./hyprland.nix
		./waybar.nix
	];

}
