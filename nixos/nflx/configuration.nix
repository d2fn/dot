{ config, pkgs, ... }:

{
	networking.hostName = "dfeatherston-p16s";
	time.timeZone = "America/Los_Angeles";
	users.users.d = {
		isNormalUser = true;
		description = "Dietrich Featherston";
		extraGroups = [ "networkmanager" "wheel" "plugdev" "docker"];
		packages = with pkgs; [
		#	thunderbird
		];
	};
	virtualisation.docker.enable = true;
}
