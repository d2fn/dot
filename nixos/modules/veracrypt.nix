{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    veracrypt
    sudo   # to satisfy veracrypt's hardcoded call
    lvm2   # provides dmsetup, also used by veracrypt
  ];

  security.sudo.enable = true;  # usually true already
}

