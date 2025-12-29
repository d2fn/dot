{ config, pkgs, ... }:

let

  dk-home = pkgs.writeShellScriptBin "dk-home" ''
    exec ${pkgs.digikam}/bin/digikam --database-directory "$HOME/Pictures" "$@"
  '';

  dk-local = pkgs.writeShellScriptBin "dk-local" ''
    exec ${pkgs.digikam}/bin/digikam --database-directory "$@"
  '';

  dkHomeDesktop = pkgs.makeDesktopItem {
    name = "digikam";
    desktopName = "DigiKam";
    exec = "dk-home";
    icon = "digikam";
    categories = [ "Graphics" ];
  };

in
{
  home.packages = [
    dk-home
    dk-local
    dkHomeDesktop
  ];
}
