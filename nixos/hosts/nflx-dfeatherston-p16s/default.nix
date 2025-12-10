{
  pkgs,
  config,
  home-manager,
  vpnManager,
  ...
}:
let
  system = pkgs.system;
in
{

  # home manager basics
  home-manager.users.d = import ./home;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit vpnManager;
  };

  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./code.nix
    ./git.nix
    ./gnome-keyring.nix
    ./nix-ld.nix
    ./packages.nix
    ./slack.nix
    ../../modules/bin-symlinks.nix
    ../../modules/code.nix
    ../../modules/core-packages.nix
    ../../modules/filemanagers.nix
    ../../modules/fonts.nix
    ../../modules/greetd.nix
    ../../modules/obsidian.nix
    ../../modules/reverse-eng.nix
    ../../modules/zsa.nix
    home-manager.nixosModules.home-manager
    vpnManager.nixosModules.vpnManager
  ];

  # vpn manager setup at system level
  vpnManager = {
    # ensure the system level module uses the same package as home
    package = vpnManager.packages.${system}.vpnManager;
    # pass the user account managing vpn secrets
    user = "d";
  };
}
