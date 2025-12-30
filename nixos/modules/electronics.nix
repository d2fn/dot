{ config, pkgs, ... }:

{
  # Packages for electronics / EDA work
  home.packages = with pkgs; [
    kicad
    ngspice
  ];
}

