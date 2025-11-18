{ config, pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		greetd.tuigreet
	];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      };
    };
  };

  services.xserver.enable = false;      # turn off the whole X11 stack if you’re on Wayland only
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.displayManager.sddm.enable = false;
	security.pam.services.login.enableGnomeKeyring = false;

  services.gnome.gnome-keyring.enable = false;
  services.gnome.evolution-data-server.enable = false;
  services.gnome.tracker-miners.enable = false;
  services.gnome.tracker.enable = false;
  programs.dconf.enable = false;
}
