{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		binutils
		file
		ghidra
		hexyl
		llvm
		rizin
		xxd
	];
}

