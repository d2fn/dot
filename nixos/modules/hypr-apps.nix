{
  lib,
  config,
  pkgs,
  ...
}:

let
  inherit (lib)
    mkOption
    mkEnableOption
    mkIf
    types
    attrValues
    mkAfter
    ;

  appType = types.submodule (
    { name, ... }:
    {
      options = {
        key = mkOption {
          type = types.str;
          description = "Key to trigger this app (used with \$mainMod).";
          example = "A";
        };

        workspace = mkOption {
          type = types.str;
          description = "Workspace number/name to bind this app to.";
          example = "4";
        };

        class = mkOption {
          type = types.str;
          description = "Window class regex (without ^$) used in windowrulev2.";
          example = "google-chrome";
        };

        cmd = mkOption {
          type = types.str;
          description = "Command to exec when pressing SUPER+key.";
          example = "google-chrome-stable";
        };

        icon = mkOption {
          type = types.str;
          description = "Icon for Waybar or other UIs.";
          default = "";
          example = "";
        };
        cmdType = mkOption {
          type = types.str;
          description = "Command type, 'exec' by default";
          default = "exec";
        };
      };
    }
  );
in
{
  options.my.hypr.apps = {
    enable = mkEnableOption "Hyprland app registry (binds + window rules)";

    entries = mkOption {
      type = types.attrsOf appType;
      default = { };
      description = "Map of app name → app config (key, workspace, class, cmd, icon).";
    };
  };

  config = mkIf config.my.hypr.apps.enable (
    let
      apps = config.my.hypr.apps.entries;
      appList = attrValues apps;

      appBinds = builtins.concatLists (
        map (app: [
          # SUPER + key → launch/focus app
          "$mainMod, ${app.key}, ${app.cmdType}, ${app.cmd}"
          # SUPER + SHIFT + key → move focused window to app workspace
          "$mainMod SHIFT, ${app.key}, movetoworkspace, ${app.workspace}"
        ]) appList
      );

      appWorkspaceRules = map (app: "workspace ${app.workspace}, class:^(${app.class})$") appList;
    in
    {
      # append to whatever you already have
      wayland.windowManager.hyprland.settings.bind = mkAfter appBinds;

      wayland.windowManager.hyprland.settings.windowrulev2 = mkAfter appWorkspaceRules;

      # optional: export icons for other modules (e.g. Waybar)
      # my.hypr.apps.icons = lib.mapAttrs (_: app: app.icon) apps;
    }
  );
}
