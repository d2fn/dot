{ config, pkgs, ... }:

{
	networking.hostName = "dfeatherston-p16s";
	time.timeZone = "America/Los_Angeles";
	users.users.d = {
		isNormalUser = true;
		description = "Dietrich Featherston";
		extraGroups = [ "networkmanager" "wheel" "plugdev" "docker" "tss"];
		packages = with pkgs; [
		#	thunderbird
		];
	};
	virtualisation.docker.enable = true;
	security.tpm2 = {
		enable = true;
		abrmd.enable = false;
		tssUser = "tss";
	};
	users.groups.tss = { };
}
