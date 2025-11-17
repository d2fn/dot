{ config, pkgs, ... }:

{
	networking.hostName = "adf";
	time.timeZone = "America/Chicago";
	users.users.d = {
		isNormalUser = true;
		description = "Dietrich Featherston";
		extraGroups = [ "networkmanager" "wheel" "plugdev" ];
		packages = with pkgs; [
		#	thunderbird
		];
	};

}
