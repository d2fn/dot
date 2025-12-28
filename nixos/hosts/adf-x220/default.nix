{
  pkgs,
  home-manager,
  vpnManager,
  ...
}:
{

  # home manager basics
  home-manager.users.d = import ./home;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./git.nix
    ../../modules/nordvpn.nix
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
  ];

}
