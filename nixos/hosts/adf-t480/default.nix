{
  inputs,
  ...
}:
{

  # home manager basics
  home-manager.users.d = import ./home;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  imports = [
    ../../modules/bin-symlinks.nix
    ../../modules/code.nix
    ../../modules/core-packages.nix
    ../../modules/dms.nix
    ../../modules/filemanagers.nix
    ../../modules/fonts.nix
    ../../modules/greetd.nix
    ../../modules/nordvpn.nix
    ../../modules/obsidian.nix
    ../../modules/reverse-eng.nix
    ../../modules/ssh.nix
    ../../modules/zsa.nix
    ./configuration.nix
    ./git.nix
    ./hardware-configuration.nix
    inputs.dms.nixosModules.dank-material-shell
    inputs.home-manager.nixosModules.home-manager
  ];

}
