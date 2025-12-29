{ config, pkgs, ... }:

{

  console.useXkbConfig = true;

  services.xserver.enable = true;
  services.xserver.xkb.options = "ctrl:nocaps";

  services.displayManager.gdm.enable = true;

  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
        [org.gnome.desktop.interface]
        enable-animations=false
    	'';

}
