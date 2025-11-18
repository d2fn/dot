{ config, pkgs, ... }:

{

	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.interface]
    enable-animations=false
	'';

	services.gnome.gnome-keyring.enable = true;
	security.pam.services.login.enableGnomeKeyring = true;

}
