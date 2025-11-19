{ config, pkgs, ... }:

{
	security.pam.services.login.enableGnomeKeyring = false;
	services.gnome.gnome-keyring.enable = false;
}
