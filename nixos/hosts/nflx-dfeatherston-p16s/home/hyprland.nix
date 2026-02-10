{ config, pkgs, ... }:

{

  imports = [
    ../../../modules/hypr-apps.nix
    ../../../modules/hyprland-core.nix
    ../../../modules/hypr-screenshot.nix
    #../../../modules/hyprpaper.nix
  ];

  #xdg.configFile."hypr/hypridle.conf".source = ./hypr/hypridle.conf;
  #xdg.configFile."hypr/hyprsunset.conf".source = ./hypr/hyprsunset.conf;

  #my.hyprpaper.enable = true;

  my.hypr = {

    screenshot.enable = true;

    core = {
      enable = true;
      mainModKey = "ALT";
      uiMode = "dms";
      launcher = "dms ipc call spotlight toggle";
      laptopDisplayScale = "2";
      borderColor1 = "rgba(ff8f66ee)";
      borderColor2 = "rgba(e93f00ee)";
      inactiveBorderColor = "rgba(3a1a1aaa)";
    };

    apps = {
      enable = true;
      entries = {

        terminal = {
          key = "SPACE";
          workspace = "1";
          class = "ghostty";
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

        slack = {
          key = "D";
          workspace = "3";
          class = "Slack";
          cmd = ''focus_or_launch "slack" "Slack"'';
          icon = "";
        };

        browser = {
          key = "A";
          workspace = "4";
          class = "google-chrome";
          cmdType = "workspace";
          cmd = "4";
          icon = "";
        };

        jetbrainsIdea = {
          key = "I";
          workspace = "5";
          class = "jetbrains-idea";
          cmdType = "workspace";
          cmd = "5";
          icon = "";
        };

        jetbrainsGateway = {
          key = "G";
          workspace = "6";
          class = "jetbrains-gateway";
          cmdType = "workspace";
          cmd = "6";
          icon = "";
        };

        jetbrainsToolbox = {
          key = "J";
          workspace = "7";
          class = "jetbrains-toolbox";
          cmdType = "workspace";
          cmd = "7";
          icon = "";
        };

        brave = {
          key = "B";
          workspace = "8";
          class = "brave-browser";
          cmd = "brave";
          icon = "";
        };

        digikam = {
          key = "P";
          workspace = "9";
          class = "org.kde.digikam";
          cmd = ''focus_or_launch "digikam" "org.kde.digikam"'';
          icon = "";
        };

      };
    };
  };
}
