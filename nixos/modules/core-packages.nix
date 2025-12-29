{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    sysstat
    alsa-utils
    bat
    brave
    btop
    copyq
    dig
    eza
    fd
    ffmpeg
    fzf
    ghostty
    git
    gopher
    jp2a
    jq
    kmod
    libnotify
    lsof
    neovim
    nethogs
    openresolv
    p7zip
    pastel
    parted
    pavucontrol
    playerctl
    pstree
    qbittorrent
    qbittorrent-cli
    ripgrep
    speedtest-cli
    starship
    stow
    tmux
    traceroute
    unzip
    wget
    xclip
    xsel
    yazi
    zip
    zoxide
  ];
}
