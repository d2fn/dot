{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "d";
    homeDirectory = "/home/d";
    stateVersion = "25.05";
    sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      OBSIDIAN_REST_API_KEY = "1d9b49c84bca523b9654ae2e7cb78c077cbae7822836469aa70b5b01cdd789ba";
    };
    packages = with pkgs; [
      celluloid
      cmatrix
      mpd
      mpv
      ncmpcpp
      telegram-desktop
      veracrypt
      vesktop
      virt-manager
      vlc
    ];
  };

  services.mpd = {
    enable = true;
    musicDirectory = "~/Dropbox/music";
    extraConfig = ''
      			audio_output {
      				type "pulse"
      				name "Pulse Output"
      			}
      		'';
  };

  xdg.configFile."ncmpcpp/config".text = ''
    		ncmpcpp_directory = "~/.config/ncmpcpp"
    		mpd_host = "localhost"
    		mpd_port = "6600"
    	'';

  # udiskie is user-level automounter
  services.udiskie = {
    enable = true;
    # these are actually the defaults, but being explicit is nice:
    automount = true;
    notify = true;
    tray = "auto";
  };

  imports = [
    ../../../modules/digikam.nix
    ../../../modules/focus_or_launch.nix
    ../../../modules/gtk.nix
    ../../../modules/nix-lsp.nix
    ../../../modules/electronics.nix
  ];

}
