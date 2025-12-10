{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.git;

    config = {
      user.name  = "Dietrich Featherston";
      user.email = "dfeatherston@netflix.com";

      init.defaultBranch = "main";
      core.editor = "nvim";
      color.ui = "auto";
      pull.rebase = "false";

      # example of more config:
      alias.lg = "log --oneline --graph --decorate";
    };

    lfs.enable = true;
  };
}

