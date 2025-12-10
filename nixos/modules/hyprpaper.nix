{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf mkAfter;
  hyprpaper-shuffle = pkgs.writeShellScriptBin "hyprpaper-shuffle" ''
    #!/usr/bin/env bash

    WALLPAPER_DIR="$HOME/dot/backgrounds"
    CURRENT_WALL=$(hyprctl hyprpaper listactive | head -1 | cut -f3 -d' ')

    # Get a random wallpaper that is not the current one
    WALLPAPER=$(find "$WALLPAPER_DIR" -path $WALLPAPER_DIR/.dtrash -prune -o -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

    # Apply the selected wallpaper
    hyprctl hyprpaper reload ,"$WALLPAPER"
  '';
in
{
  options.my.hyprpaper = {
    enable = mkEnableOption "shared Hyprland screenshot + color picker bindings";
  };

  config = mkIf config.my.hyprpaper.enable {
    # 1) Hyprpaper daemon (user service)
    home.packages = [
      hyprpaper-shuffle
    ];
    services.hyprpaper = {
      enable = true;
      package = pkgs.hyprpaper; # optional; defaults to pkgs.hyprpaper

      # This maps directly to hyprpaper.conf keys
      settings = {
        # allow `hyprctl hyprpaper ...` :contentReference[oaicite:0]{index=0}
        ipc = "on";
        # no startup splash
        splash = false;
        splash_offset = 2.0;

        # Preload wallpapers into RAM
        preload = [
          "${config.home.homeDirectory}/dot/backgrounds/0-ship-at-sea.jpg"
          "${config.home.homeDirectory}/dot/backgrounds/1-everforest.jpg"
          "${config.home.homeDirectory}/dot/backgrounds/1.jpg"
          "${config.home.homeDirectory}/dot/backgrounds/1-matte-black.jpg"
          "${config.home.homeDirectory}/dot/backgrounds/1-osaka-jade-bg.jpg"
          "${config.home.homeDirectory}/dot/backgrounds/1-scenery-pink-lakeside-sunset-lake-landscape-scenic-panorama-7680x3215-144.png"
          "${config.home.homeDirectory}/dot/backgrounds/2.jpg"
          "${config.home.homeDirectory}/dot/backgrounds/2-matte-black-hands.jpg"
          "${config.home.homeDirectory}/dot/backgrounds/2-osaka-jade-bg.jpg"
          "${config.home.homeDirectory}/dot/backgrounds/3-osaka-jade-bg.jpg"
          "${config.home.homeDirectory}/dot/backgrounds/3-ristretto.jpg"
        ];

        # Assign a wallpaper to a monitor:
        wallpaper = [
          ",${config.home.homeDirectory}/dot/backgrounds/2-osaka-jade-bg.jpg"
        ];
      };
    };
  };
}
