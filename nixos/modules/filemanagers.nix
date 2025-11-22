{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
	  nautilus
		sushi
	];
}
