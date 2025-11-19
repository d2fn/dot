{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  # optional but nice so Qt apps follow GTK
  qt = {
    enable = true;
    platformTheme = {
			name = "gtk";
		};
    style = {
      name = "Adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
