{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "d";
    homeDirectory = "/home/d";
    stateVersion = "25.11";
    sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      OBSIDIAN_REST_API_KEY = "adab958a7d5cb2e37f62817d4c473ee540694d5069727af26ec990c70823156e";
      MOZ_ENABLE_WAYLAND = "1";
    };
    packages = with pkgs; [
      celluloid
      alacritty
      kitty
      cmatrix
      krita
      mpv
      veracrypt
      vesktop
      virt-manager
      vlc
    ];
  };

  programs.firefox.enable = true;

  # udiskie is user-level automounter
  services.udiskie = {
    enable = true;
    # these are actually the defaults, but being explicit is nice:
    automount = true;
    notify = true;
    tray = "auto";
  };

  imports = [
    ../../../modules/gtk.nix
    ../../../modules/nix-lsp.nix
    ../../../modules/focus_or_launch.nix
    ../../../modules/digikam.nix
    ../../../modules/dropbox.nix
    ../../../modules/electronics.nix
    ./hyprland.nix
    #./waybar.nix
  ];

}
