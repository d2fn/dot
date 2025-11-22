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
	};

	imports = [
		../../hm/gtk.nix
		../../modules/focus_or_launch.nix
		./dropbox.nix
		./hyprland.nix
		./waybar.nix
	];

}
