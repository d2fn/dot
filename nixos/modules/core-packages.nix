{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
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
    home-manager
    jp2a
    jq
    kmod
    libnotify
    lsof
    neovim
    nethogs
    p7zip
    parted
    pastel
    pavucontrol
    playerctl
    pstree
    qbittorrent
    qbittorrent-cli
    ripgrep
    speedtest-cli
    starship
    stow
    sysstat
    systemd
    tmux
    traceroute
    unzip
    vim # for xdd
    wget
    xclip
    xsel
    yazi
    zip
    qpdf
    zoxide
  ];
}
