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

			"$mainMod" = "ALT";
			"$secondaryMod" = "CTRL";

      # top-level flags
      "debug:disable_logs" = false;

			# variables
			"$osdclient" = "swayosd-client --monitor \"$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')\"";
			"$terminal" = "ghostty";
			"$fileManager" = "nautilus";
			"$menu" = "rofi -show drun";

      ################
      ### MONITORS ###
      ################
      monitor = [
        "eDP-1,preferred,auto,1"
        "desc:BNQ BenQ RD280U L8R0071401Q,preferred,auto,2"
        "desc:Dell Inc. DELL U3421WE 376L653,preferred,auto,1"
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
				"float,  match:class:^(digikam)$, match:modal:1"
				"center, match:class:^(digikam)$, match:modal:1"
      ];

      windowrulev2 = [
        "workspace 2, class:^(brave-browser)$"
        "workspace 3, class:^(obsidian)$"
      ];

      bindl = [
				# Trigger when the switch is turning on.
				", switch:on:Lid Switch, exec, hyprctl keyword monitor \"eDP-1,disable\""
				# Trigger when the switch is turning off.
				", switch:off:Lid Switch, exec, hyprctl keyword monitor \"desc:AU Optronics 0x103D,preferred,auto,1\"; hyprctl keyword monitor \"desc:Samsung Display Corp. 0x4165,preferred,auto,2\""
				# play pause controls
				", XF86AudioNext, exec, playerctl next"
				", XF86AudioPause, exec, playerctl play-pause"
				", XF86AudioPlay, exec, playerctl play-pause"
				", XF86AudioPrev, exec, playerctl previous"
			];

			bind = [
				# close / kill
				"$mainMod SHIFT, L, exec, hyprlock"
				"$mainMod SHIFT, Q, exit"
				"$mainMod SHIFT, C, killactive,"
				# launchers
				"$mainMod $secondaryMod, SPACE, exec, $terminal"
				"$mainMod, SPACE, workspace, 1"
				"$mainMod, A, workspace, 2"
				"$mainMod, S, workspace, 3"
				"$mainMod, D, workspace, 4"
				"$mainMod, F, workspace, 5"
				"$mainMod, O, exec, focus_or_launch \"obsidian\" \"obsidian\""
				"$mainMod, E, exec, $fileManager"
				"$mainMod, R, exec, $menu"
				# window management
				"$mainMod $secondaryMod, F, togglefloating,"
				"$mainMod, P, pseudo, # dwindle"
				"$mainMod $secondaryMod, S, togglesplit, # dwindle"
				# Move focus with mainMod + hjkl
				"$mainMod $secondaryMod, h, movefocus, l"
				"$mainMod $secondaryMod, j, movefocus, d"
				"$mainMod $secondaryMod, k, movefocus, u"
				"$mainMod $secondaryMod, l, movefocus, r"
				# Switch workspaces with mainMod + [0-9]
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"
				# Move active window to a workspace with mainMod + secondaryMod + [0-9]
				"$mainMod $secondaryMod, 1, movetoworkspace, 1"
				"$mainMod $secondaryMod, 2, movetoworkspace, 2"
				"$mainMod $secondaryMod, 3, movetoworkspace, 3"
				"$mainMod $secondaryMod, 4, movetoworkspace, 4"
				"$mainMod $secondaryMod, 5, movetoworkspace, 5"
				"$mainMod $secondaryMod, 6, movetoworkspace, 6"
				"$mainMod $secondaryMod, 7, movetoworkspace, 7"
				"$mainMod $secondaryMod, 8, movetoworkspace, 8"
				"$mainMod $secondaryMod, 9, movetoworkspace, 9"
				"$mainMod $secondaryMod, 0, movetoworkspace, 10"
				
				### screenshot support
				# Full screen → file
				"SUPER SHIFT, 3, exec, grim ~/Pictures/screenshot-$(date +'%Y%m%d-%H%M%S').png && notify-send \"📸 Screenshot saved\""
				# Full screen → clipboard
				"CTRL SUPER SHIFT, 3, exec, grim - | wl-copy && notify-send \"📋 Screenshot copied\""
				# Selection → file
				"SUPER SHIFT, 4, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +'%Y%m%d-%H%M%S').png && notify-send \"📸 Region saved\""
				# Selection → clipboard
				"CTRL SUPER SHIFT, 4, exec, grim -g \"$(slurp)\" - | wl-copy && notify-send \"📋 Region copied\""

				### color picking support
				# hyprpicker to clipboard
				"CTRL SUPER SHIFT, K, exec, hyprpicker --autocopy --format=rgb && notify-send \"Color copied\""
				"CTRL SUPER SHIFT, H, exec, hyprpicker --autocopy --format=hex && notify-send \"Color copied\""
			];

			bindm = [
				# Move/resize windows with mainMod + LMB/RMB and dragging
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];

			bindel = [
				# Laptop multimedia keys for volume and LCD brightness
				",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
			];

			bindeld = [
				",XF86MonBrightnessUp, Brightness up, exec, $osdclient --brightness raise"
				",XF86MonBrightnessDown, Brightness down, exec, $osdclient --brightness lower"
			];

    };

    # Stuff Hyprland doesn't have a nice Nix schema for (variables, binds, etc.)
    extraConfig = ''
			### add extra config here
    '';
  };

	xdg.configFile."hypr/hypridle.conf".source = ./hypr/hypridle.conf;
	xdg.configFile."hypr/hyprsunset.conf".source = ./hypr/hyprsunset.conf;
}

