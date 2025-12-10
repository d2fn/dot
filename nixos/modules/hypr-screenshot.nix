{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf mkAfter;
in
{
  options.my.hypr.screenshot = {
    enable = mkEnableOption "shared Hyprland screenshot + color picker bindings";
  };

  config = mkIf config.my.hypr.screenshot.enable {
    # tools needed by the bindings
    home.packages = with pkgs; [
      grim
      slurp
      wl-clipboard
      hyprpicker
      swaynotificationcenter
      libnotify # for notify-send
    ];

    wayland.windowManager.hyprland.settings.bind = mkAfter [
      ### screenshot support
      # Full screen → file
      "SUPER SHIFT, 3, exec, grim ~/Pictures/screenshot-$(date +'%Y%m%d-%H%M%S').png && notify-send \"📸 Screenshot saved\""
      # Full screen → clipboard
      "CTRL SUPER SHIFT, 3, exec, grim - | wl-copy && notify-send \"📋 Screenshot copied\""
      # Selection → file
      "SUPER SHIFT, 4, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +'%Y%m%d-%H%M%S').png && notify-send \"📸 Region saved\""
      # Selection → clipboard
      "CTRL SHIFT, 4, exec, grim -g \"$(slurp)\" - | wl-copy && notify-send \"📋 Region copied\""

      ### color picking support
      "$hyper, K, exec, hyprpicker --autocopy --format=rgb && notify-send \"Color copied\""
      "$hyper, H, exec, hyprpicker --autocopy --format=hex && notify-send \"Color copied\""
    ];
  };
}
