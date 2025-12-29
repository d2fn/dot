{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    tuigreet
  ];

  environment.etc."issue".source = ./greetd-issue.txt;

  services.greetd = {
    enable = true;
    # start on tty2
    # vt = 2;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      };
    };
  };

  services.xserver.enable = false; # turn off the whole X11 stack if you’re on Wayland only
  services.displayManager.gdm.enable = false;
  services.displayManager.sddm.enable = false;

  services.gnome.evolution-data-server.enable = false;
  services.gnome.tinysparql.enable = false;
  services.gnome.localsearch.enable = false;
}
