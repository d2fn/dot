{ config, pkgs, ... }:

{

  imports = [
    ../../../modules/hypr-apps.nix
    ../../../modules/hyprland-core.nix
    ../../../modules/hypr-screenshot.nix
    ../../../modules/hyprpaper.nix
  ];

  xdg.configFile."hypr/hypridle.conf".source = ./hypr/hypridle.conf;
  xdg.configFile."hypr/hyprsunset.conf".source = ./hypr/hyprsunset.conf;

  my.hyprpaper.enable = true;

  my.hypr = {

    screenshot.enable = true;

    core = {
      enable = true;
      mainModKey = "ALT";
      terminal = "alacritty";
      laptopDisplayScale = "1";
      gapsIn = "1";
      gapsOut = "3";
      borderSize = "1";
    };

    apps = {
      enable = true;
      entries = {

        terminal = {
          key = "SPACE";
          workspace = "1";
          class = "alacritty";
          cmdType = "workspace";
          cmd = "1";
          icon = "";
        };

        obsidian = {
          key = "O";
          workspace = "2";
          class = "obsidian";
          cmd = ''focus_or_launch "obsidian" "obsidian"'';
          icon = "";
        };

        browser = {
          key = "A";
          workspace = "3";
          class = "firefox";
          cmdType = "workspace";
          cmd = "3";
          icon = "";
        };

        digikam = {
          key = "P";
          workspace = "4";
          class = "org.kde.digikam";
          cmd = ''focus_or_launch "dk-home" "org.kde.digikam"'';
          icon = "";
        };
      };
    };
  };
}
