{ config, pkgs, ... }:

{
  home.username = "d";
  home.homeDirectory = "/home/d";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  imports = [
    ../../hm/gtk.nix
    ./hyprland.nix
    ./waybar.nix
  ];

}
