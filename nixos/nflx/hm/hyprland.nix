{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    cmatrix
    grim
    hypridle
    hyprlock
    hyprpicker
    hyprsunset
    rofi
    slurp
    swaynotificationcenter
    swayosd
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
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
				"eDP-1,preferred,auto,2"
				",preferred,auto,1"
			];

      #########################
      ### AUTOSTART / ENV   ###
      #########################
      exec-once = [
        "hypridle & hyprsunset & swaync & waybar & swayosd-server &"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      #####################
      ### LOOK AND FEEL ###
      #####################
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;

        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 4;
        rounding_power = 2;

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

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
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

      gestures = {
        workspace_swipe = false;
      };

      device = [
        {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        }
      ];

      ##############################
      ### WINDOWS / WORKSPACES   ###
      ##############################
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      windowrulev2 = [
				"workspace 2, class:^(brave-browser)$"
				"workspace 3, class:^(Slack)$"
				"workspace 4, class:^(google-chrome)$"
				"workspace 5, class:^(jetbrains-idea)$"
				"workspace 6, class:^(jetbrains-gateway)$"
				"workspace 6, class:^(jetbrains-toolbox)$"
      ];
    };

    # Stuff Hyprland doesn't have a nice Nix schema for (variables, binds, etc.)
    extraConfig = ''
      ###################
      ### VARIABLES   ###
      ###################
      $osdclient = swayosd-client --monitor "$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')"

      $terminal = ghostty
      $chrome = google-chrome-stable
      $brave = brave
      $fileManager = nautilus
      $menu = rofi -show drun

      $mainMod = ALT
      $hyper = SUPER CTRL ALT SHIFT

      ################
      ### MONITORS ###
      ################
      # Lid switch bindings
      # Trigger when the switch is turning on.
      bindl = , switch:on:Lid Switch, exec, hyprctl keyword monitor "eDP-1,disable"
      # Trigger when the switch is turning off.
      bindl = , switch:off:Lid Switch, exec, hyprctl keyword monitor "desc:AU Optronics 0x103D,preferred,auto,1"; hyprctl keyword monitor "desc:Samsung Display Corp. 0x4165,preferred,auto,2"

      ###################
      ### KEYBINDINGS ###
      ###################

      bind = $mainMod SHIFT, L, exec, hyprlock
      bind = $mainMod SHIFT, Q, exit
      bind = $mainMod SHIFT, C, killactive,

      bind = $mainMod SHIFT, SPACE, exec, $terminal
      bind = $mainMod, SPACE, workspace, 1
      bind = $mainMod, A, workspace, 2
      bind = $mainMod, S, workspace, 3
      bind = $mainMod, D, workspace, 4
      bind = $mainMod, F, workspace, 5
      bind = $mainMod, E, exec, $fileManager

      bind = $mainMod SHIFT, F, togglefloating,
      bind = $mainMod, R, exec, $menu
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod SHIFT, S, togglesplit, # dwindle

      # Move focus with mainMod + hjkl
      bind = $mainMod, h, movefocus, l
      bind = $mainMod, l, movefocus, r
      bind = $mainMod, k, movefocus, u
      bind = $mainMod, j, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      # Laptop multimedia keys for volume and LCD brightness
      bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

      bindeld = ,XF86MonBrightnessUp, Brightness up, exec, $osdclient --brightness raise
      bindeld = ,XF86MonBrightnessDown, Brightness down, exec, $osdclient --brightness lower

      # Requires playerctl
      bindl = , XF86AudioNext, exec, playerctl next
      bindl = , XF86AudioPause, exec, playerctl play-pause
      bindl = , XF86AudioPlay, exec, playerctl play-pause
      bindl = , XF86AudioPrev, exec, playerctl previous

      # --- Screenshots ---

      # Full screen → file
      bind = SUPER SHIFT, 3, exec, grim ~/Pictures/screenshot-$(date +'%Y%m%d-%H%M%S').png && notify-send "📸 Screenshot saved"

      # Full screen → clipboard
      bind = CTRL SUPER SHIFT, 3, exec, grim - | wl-copy && notify-send "📋 Screenshot copied"

      # Selection → file
      bind = SUPER SHIFT, 4, exec, grim -g "$(slurp)" ~/Pictures/screenshot-$(date +'%Y%m%d-%H%M%S').png && notify-send "📸 Region saved"

      # Selection → clipboard
      bind = CTRL SUPER SHIFT, 4, exec, grim -g "$(slurp)" - | wl-copy && notify-send "📋 Region copied"

      # hyprpicker to clipboard
      bind = CTRL SUPER SHIFT, K, exec, hyprpicker --autocopy --format=rgb && notify-send "Color copied"
      bind = CTRL SUPER SHIFT, H, exec, hyprpicker --autocopy --format=hex && notify-send "Color copied"
    '';
  };

}

