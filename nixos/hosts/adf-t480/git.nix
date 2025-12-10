{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.git;

    config = {
      user.name  = "Dietrich Featherston";
      user.email = "d@d2fn.com";

      init.defaultBranch = "master";
      core.editor = "nvim";
      color.ui = "auto";
      pull.rebase = "false";

      # example of more config:
      alias.lg = "log --oneline --graph --decorate";
    };

    lfs.enable = true;
  };
}

