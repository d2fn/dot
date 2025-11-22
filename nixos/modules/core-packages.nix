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
		jp2a
		jq
		kmod
		libnotify
		lsof
		neovim
		nethogs
		openresolv
		p7zip
		pavucontrol
		playerctl
		pstree
		qbittorrent
		qbittorrent-cli
		ripgrep
		speedtest-cli
		starship
		steam-run
		stow
		tmux
		traceroute
		unzip
		wget
		wgnord
		wireguard-tools
		xclip
		xsel
		yazi
		zip
		zoxide
	];
}
