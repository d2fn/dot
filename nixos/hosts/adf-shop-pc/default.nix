{
  pkgs,
  inputs,
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
    ../../modules/dms.nix
    ../../modules/nordvpn.nix
    ../../modules/bin-symlinks.nix
    ../../modules/code.nix
    ../../modules/core-packages.nix
    ../../modules/filemanagers.nix
    ../../modules/fonts.nix
    ../../modules/obsidian.nix
    ../../modules/reverse-eng.nix
    ../../modules/zsa.nix
    inputs.dms.nixosModules.dank-material-shell
    inputs.home-manager.nixosModules.home-manager
  ];

}
