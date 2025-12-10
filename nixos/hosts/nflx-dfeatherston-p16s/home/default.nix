{
  config,
  pkgs,
  vpnManager,
  ...
}:

{

  programs.home-manager.enable = true;

  home = {
    username = "d";
    homeDirectory = "/home/d";
    stateVersion = "25.05";
    sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      OBSIDIAN_REST_API_KEY = "4709ff07a26d7ffa8c8c333ac7eeec969b89e4a3db258783767f29d6303a8126";
    };
    packages = with pkgs; [
      jetbrains-toolbox
      digikam
      cmatrix
    ];
  };

  imports = [
    vpnManager.homeManagerModules.vpnManager
    ../../../modules/gtk.nix
    ../../../modules/nix-lsp.nix
    ../../../modules/focus_or_launch.nix
    ./hyprland.nix
    ./waybar.nix
  ];

  vpnManager = {
    enable = true;
    vpn.url = "https://pcs.flxvpn.net/emp";
    openconnect = {
      verbose = true;
      extraArgs = "-v --no-dtls";
      shutdownGracePeriodSeconds = 10;
      dryRun = false;
    };
    controller = {
      intervalSeconds = 1;
      healthCheckGracePeriodSeconds = 10;
    };
    healthCheck = {
      host = "192.173.91.18";
      port = "443";
      timeoutSeconds = 2;
    };
    dsidCookiePoller = {
      cookiePath = "/home/d/.config/google-chrome/Profile 1/Cookies";
      cookieHost = "pcs.flxvpn.net";
    };
  };
}
