{ config, pkgs, ... }:

let
  dk-home = pkgs.writeShellScriptBin "dk-home" ''
    exec ${pkgs.digikam}/bin/digikam --database-directory "$HOME/Dropbox/photos" "$@"
  '';

  dk-pvt = pkgs.writeShellScriptBin "dk-pvt" ''
    exec ${pkgs.digikam}/bin/digikam --database-directory "$HOME/media/mnt/sandisk8t/_" "$@"
  '';

  dkHomeDesktop = pkgs.makeDesktopItem {
    name = "dk-home";
    desktopName = "DigiKam (Home)";
    exec = "dk-home";
    icon = "digikam";
    categories = [ "Graphics" ];
  };

  dkPvtDesktop = pkgs.makeDesktopItem {
    name = "dk-pvt";
    desktopName = "DigiKam (Private)";
    exec = "dk-pvt";
    icon = "digikam";
    categories = [ "Graphics" ];
  };
in {
  home.packages = [
    dk-home
    dk-pvt
    dkHomeDesktop
    dkPvtDesktop
  ];
}

