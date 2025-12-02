{ config, pkgs, ... }:

let

  dk-home = pkgs.writeShellScriptBin "dk-home" ''
    exec ${pkgs.digikam}/bin/digikam --database-directory "$HOME/Dropbox/photos" "$@"
  '';

  dkHomeDesktop = pkgs.makeDesktopItem {
    name = "dk";
    desktopName = "DigiKam";
    exec = "dk-home";
    icon = "digikam";
    categories = [ "Graphics" ];
  };

in {
  home.packages = [
    dk-home
    dkHomeDesktop
  ];
}

