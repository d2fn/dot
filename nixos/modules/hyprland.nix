{ config, pkgs, ... }:

{
	programs.hyprland = {
		enable = true;
	};

	environment.systemPackages = with pkgs; [
		# hyprland packages
		brightnessctl
		cmatrix
		grim
		hypridle
		hyprlock
		hyprpicker
		hyprsunset
		rofi
		slurp
		swaynotificationcenter
		swayosd
		waybar
		wl-clipboard
	];
}

