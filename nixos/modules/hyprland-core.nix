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
  # Helper: start user services via systemctl
  mkStart = svc: "systemctl --user start ${svc}";
  mkRestart = svc: "systemctl --user restart ${svc}";
  # In DMS mode, make sure systemd-user has Wayland/session env,
  # then start dms (and optionally stop classic stuff).
  dmsExecOnce = [
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_SESSION_TYPE XDG_CURRENT_DESKTOP XDG_RUNTIME_DIR DISPLAY HYPRLAND_INSTANCE_SIGNATURE XDG_SESSION_ID XDG_SEAT XDG_VTNR"
    #(mkRestart "hyprsunset.service")
    (mkRestart "dms.service")
    (mkStart "hyprland-session.target")
  ];
  classicExecOnce = map mkStart config.my.hypr.core.autostartUserServices;
in
{

  options.my.hypr.core = {
    enable = mkEnableOption "Core hyprland config";
    mainModKey = mkOption {
      type = types.str;
      description = "Main mod key, e.g. SUPER or ALT";
      default = "SUPER";
    };

    uiMode = mkOption {
      type = types.enum [
        "classic"
        "dms"
      ];
      default = "dms";
      description = "UI stack to run: classic (waybar/swaync/etc) or dms (DankMaterialShell).";
    };

    autostartUserServices = mkOption {
      type = types.listOf types.str;
      default = [
        "hypridle.service"
        "hyprsunset.service"
        "waybar.service"
        "swaync.service"
      ];
      description = "User systemd services to start via exec-once when uiMode=classic.";
    };

    launcher = mkOption {
      type = types.str;
      description = "Launcher";
      default = "dms ipc call spotlight toggle";
    };

    terminal = mkOption {
      type = types.str;
      description = "Terminal app";
      default = "ghostty";
    };

    gapsIn = mkOption {
      type = types.str;
      description = "Interior gaps";
      default = "5";
    };
    gapsOut = mkOption {
      type = types.str;
      description = "Outer gaps";
      default = "10";
    };
    borderSize = mkOption {
      type = types.str;
      description = "Border size in pixels";
      default = "2";
    };
    laptopDisplayScale = mkOption {
      type = types.str;
      description = "Set to 1 for standard displays and 2 for retina class";
      default = "1";
    };
    borderColor1 = mkOption {
      type = types.str;
      description = "Border color 1";
      default = "rgba(33ccffee)";
    };
    borderColor2 = mkOption {
      type = types.str;
      description = "Border color 1";
      default = "rgba(00ff99ee)";
    };
    inactiveBorderColor = mkOption {
      type = types.str;
      description = "Inactive border color";
      default = "rgba(595959aa)";
    };
  };

  config = mkIf config.my.hypr.core.enable {

    home.packages = with pkgs; [
      #brightnessctl
      #hypridle
      #hyprlock
      hyprsunset
      #rofi
      #wl-clipboard
    ];

    wayland.windowManager.hyprland = {
      enable = true;

      settings = {

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };

        ###################
        ### VARIABLES   ###
        ###################

        "$mainMod" = "${config.my.hypr.core.mainModKey}";
        "$hyper" = "SUPER CTRL ALT SHIFT";

        # top-level flags
        "debug:disable_logs" = false;

        ################
        ### MONITORS ###
        ################

        monitor = [
          # See https://wiki.hyprland.org/Configuring/Monitors/
          "desc:Samsung Display Corp. 0x4165,preferred,auto,2"
          "desc:BNQ BenQ RD280U L8R0071401Q,preferred,auto,2"
          "desc:Dell Inc. DELL U3421WE 376L653,preferred,auto,1"
          "eDP-1,preferred,auto,${config.my.hypr.core.laptopDisplayScale}"
          ",preferred,auto,1"
        ];

        #########################
        ### AUTOSTART / ENV   ###
        #########################

        exec-once = (if config.my.hypr.core.uiMode == "dms" then dmsExecOnce else classicExecOnce);

        #exec-once = [
        #"swaync & swayosd-server &"
        #"systemctl --user start hyprsunset.service"
        #"systemctl --user start hypridle.service"
        #"systemctl --user start waybar.service"
        #];

        env = [
          "XCURSOR_SIZE,24"
          "HYPRCURSOR_SIZE,24"
        ];

        #####################
        ### LOOK AND FEEL ###
        #####################
        general = {
          "gaps_in" = "${config.my.hypr.core.gapsIn}";
          "gaps_out" = "${config.my.hypr.core.gapsOut}";
          "border_size" = "${config.my.hypr.core.borderSize}";

          "col.active_border" =
            "${config.my.hypr.core.borderColor1} ${config.my.hypr.core.borderColor2} 45deg";
          "col.inactive_border" = "${config.my.hypr.core.inactiveBorderColor}";

          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };

        decoration = {
          rounding = 0;
          rounding_power = 0;

          active_opacity = 1.0;
          inactive_opacity = 1.0;

          shadow = {
            enabled = false;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };

          blur = {
            enabled = true;
            size = 4;
            passes = 2;
            vibrancy = 0.1696;
          };
        };

        animations = {
          enabled = false;
          # rest of animations omitted since they’re unused while disabled
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = {
          new_status = "master";
        };

        #############
        ### INPUT ###
        #############
        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "ctrl:nocaps";
          kb_rules = "";

          follow_mouse = 1;
          sensitivity = 0;

          touchpad = {
            natural_scroll = false;
          };
        };

        device = [
          {
            name = "epic-mouse-v1";
            sensitivity = -0.5;
          }
          {
            name = "tpps/2-elan-trackpoint";
            accel_profile = "adaptive";
            sensitivity = -0.4;
          }
        ];

        ##############################
        ### WINDOWS / WORKSPACES   ###
        ##############################
        windowrule = [
          "suppressevent maximize, class:.*"
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        ];

        bindl = [

          # switch == "on" means closing the lid
          # disable laptop display when closing lid
          ", switch:on:Lid Switch, exec, hyprctl keyword monitor \"eDP-1,disable\""

          # switch == "off" means opening the lid
          # enable laptop display when opening lid
          ", switch:off:Lid Switch, exec, hyprctl keyword monitor \"eDP-1,preferred,auto,${config.my.hypr.core.laptopDisplayScale}\""

          # play pause controls for built in media controls
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
        ];

        bind = [

          # close / kill
          "$mainMod SHIFT, L, exec, loginctl lock-session"
          "$mainMod, W, killactive,"
          "$hyper, Q, exit"

          "$mainMod, V, exec, dms ipc call clipboard toggle"
          "$mainMod, comma, exec, dms ipc call settings focusOrToggle"
          "$mainMod, M, exec, dms ipc call processlist focusOrToggle"

          "$mainMod, N, exec, dms ipc call notifications toggle"
          "$mainMod, Y, exec, dms ipc call dankdash wallpaper"

          # bare bones launchers hardcoded
          "$mainMod, R, exec, dms ipc call spotlight toggle"
          "$mainMod SHIFT, T, exec, ${config.my.hypr.core.terminal}"
          "$mainMod, E, exec, nautilus"

          # window management
          "$mainMod SHIFT, F, togglefloating,"
          "$mainMod SHIFT, S, togglesplit, # dwindle"

          # Move focus with mainMod + hjkl
          "$mainMod, h, movefocus, l"
          "$mainMod, j, movefocus, d"
          "$mainMod, k, movefocus, u"
          "$mainMod, l, movefocus, r"

          # Switch workspaces with mainMod + [1-9]
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"

          # Move active window to a workspace with mainMod + secondaryMod + [1-9]
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"

        ];

        bindm = [
          # Move/resize windows with mainMod + LMB/RMB and dragging
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        bindel = [
          # Laptop multimedia keys for volume and LCD brightness
          ",XF86AudioRaiseVolume, exec, dms ipc call audio increment 3"
          ",XF86AudioLowerVolume, exec, dms ipc call audio decrement 3"
          ",XF86AudioMute, exec, dms ipc call audio mute"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ];

        bindeld = [
          ",XF86MonBrightnessUp, Brightness up, exec, dms ipc call brightness increment 5 \"\""
          ",XF86MonBrightnessDown, Brightness down, exec, dms ipc call brightness decrement 5 \"\""
        ];
        # Persistent workspaces 1–10 (Hyprland uses 1-based by default)
        "workspace" = [
          "1, persistent:true"
          "2, persistent:true"
          "3, persistent:true"
          "4, persistent:true"
          "5, persistent:true"
          "6, persistent:true"
          "7, persistent:true"
          "8, persistent:true"
          "9, persistent:true"
        ];
      };

      # Stuff Hyprland doesn't have a nice Nix schema for (variables, binds, etc.)
      extraConfig = '''';

    };
  };
}
