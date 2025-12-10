{ config, pkgs, ... }:

{

	# enable HM’s Dropbox service
	services.dropbox = {
		enable = true;
		# optional, explicitly set where the Dropbox folder lives:
		# path = "${config.home.homeDirectory}/Dropbox";
	};
}
