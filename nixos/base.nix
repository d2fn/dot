{ config, pkgs, ... }:

{

	imports = [
		./modules/bin-synlinks.nix
		./modules/code.nix
		./modules/core-packages.nix
		./modules/fonts.nix
		./modules/hyprland.nix
		./modules/reverse-eng.nix
		./modules/zsa.nix
	];

	system.stateVersion = "25.05";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nixpkgs.config.allowUnfree = true;

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.networkmanager.enable = true;
  programs.ssh.startAgent = true;
  programs.ssh.askPassword = "";
	

	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	console.useXkbConfig = true;

	services.xserver.enable = true;
	services.xserver.xkb.options = "ctrl:nocaps";

	services.printing.enable = true;

	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

}
