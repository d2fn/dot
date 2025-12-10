
{ config, pkgs, ... }:

{
	programs.nix-ld.enable = true;
	programs.nix-ld.libraries = with pkgs; [
		# Add any missing dynamic libraries for unpackaged programs
		# here, NOT in environment.systemPackages
		libglvnd
		# X11 & XCB stack
		xorg.libX11
		xorg.libXext
		xorg.libXrender
		xorg.libXi
		xorg.libSM
		xorg.libICE
		xorg.libXau
		xorg.libXdmcp
		xorg.libxcb
		xorg.xcbutilimage
		xorg.xcbutilkeysyms
		xorg.xcbutilwm
		xorg.xcbutilrenderutil
		# Fonts/input
		fontconfig
		freetype
		libxkbcommon
		# Common deps
		glib
		zlib
		# Mesa drivers (software GL fallback & vendor libs)
		mesa
	];
}
