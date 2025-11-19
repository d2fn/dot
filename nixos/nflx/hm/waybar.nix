
{ config, pkgs, ... }:

{
  home.packages = [ pkgs.waybar ];
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;
  xdg.configFile."waybar/config".source = ./waybar/config;
}

