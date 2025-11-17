{ config, pkgs, ... }:

{
	fonts.packages = [
		pkgs.nerd-fonts.inconsolata-go
		pkgs.nerd-fonts.jetbrains-mono
		pkgs.nerd-fonts.hack
	];
}

