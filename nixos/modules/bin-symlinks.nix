{ config, pkgs, ... }:

{
	systemd.tmpfiles.rules = [
		"L+ /bin/bash - - - - ${pkgs.bash}/bin/bash"
		"L+ /bin/cat - - - - ${pkgs.coreutils}/bin/cat"
	];
}

