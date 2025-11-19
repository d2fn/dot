{ config, pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		greetd.tuigreet
	];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --issue --cmd Hyprland";
      };
    };
  };

  services.xserver.enable = false;      # turn off the whole X11 stack if you’re on Wayland only
  services.xserver.displayManager.gdm.enable = false;
  services.displayManager.sddm.enable = false;
	security.pam.services.login.enableGnomeKeyring = false;

  services.gnome.gnome-keyring.enable = false;
  services.gnome.evolution-data-server.enable = false;
  services.gnome.tinysparql.enable = false;
  services.gnome.localsearch.enable = false;
  programs.dconf.enable = false;
}
