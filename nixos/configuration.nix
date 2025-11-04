# Edit this configuration file to define what should be installed on
# your system.	Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
		];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "dfeatherston-p16s"; # Define your hostname.
	# networking.wireless.enable = true;	# Enables wireless support via wpa_supplicant.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "America/Chicago";

	# Select internationalisation properties.
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

	systemd.tmpfiles.rules = [
		"L+ /bin/bash - - - - ${pkgs.bash}/bin/bash"
	];

  programs.ssh.startAgent = true;		  # start ssh-agent on login
  programs.ssh.askPassword = "";		   # disable GUI askpass; use terminal prompt
	
	console.useXkbConfig = true;

	# Enable the X11 windowing system.
	services.xserver.enable = true;

	services.xserver.xkb.options = "ctrl:nocaps";

	# Enable the GNOME Desktop Environment.
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.interface]
    enable-animations=false
	'';

	services.gnome.gnome-keyring.enable = true;
	security.pam.services.login.enableGnomeKeyring = true;

	# Enable CUPS to print documents.
	services.printing.enable = true;

	# Enable sound with pipewire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# If you want to use JACK applications, uncomment this
		#jack.enable = true;

		# use the example session manager (no others are packaged yet so this is enabled by default,
		# no need to redefine it in your config for now)
		#media-session.enable = true;
	};

  # 2) Declare the plugdev group and put your user in it
  users.groups.plugdev = { };

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.d = {
		isNormalUser = true;
		description = "Dietrich Featherston";
		extraGroups = [ "networkmanager" "wheel" "plugdev" ];
		packages = with pkgs; [
		#	thunderbird
		];
	};

	fonts.packages = [
		pkgs.nerd-fonts.inconsolata-go
		pkgs.nerd-fonts.jetbrains-mono
		pkgs.nerd-fonts.hack
	];


	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
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
		jp2a
		jq
		kmod
		libnotify
		lsof
		neovim
		nethogs
		obsidian
		pavucontrol
		playerctl
		pstree
		ripgrep
		starship
		steam-run
		stow
		tmux
		traceroute
		unzip
		wget
		wl-clipboard
		xclip
		xsel
		yazi
		zip
		zoxide

		# hyprland packages
		brightnessctl
		grim
		hypridle
		hyprlock
		hyprpicker
		hyprsunset
		slurp
		swaynotificationcenter
		swayosd
		waybar

		# reverse engineering
		binutils
		file
		ghidra
		hexyl
		llvm
		rizin
		xxd

		# language runtimes
		gcc
		clang
		go
		gopls
		jdk24
		jdt-language-server
		nodejs
		protobuf
		sqlite
		tree-sitter

		# nflx
		google-chrome
		jetbrains-toolbox
		nss
		nssTools
		openssl
		python3
		slack
		udev

	];

	programs.starship = {
		enable = true;
	};

	programs.hyprland = {
		enable = true;
	};

	programs.nix-ld.enable = true;
	programs.nix-ld.libraries = with pkgs; [
		# Add any missing dynamic libraries for unpackaged programs
		# here, NOT in environment.systemPackages
		# for metatron

		libglvnd

		# X11 & XCB stack
		xorg.libX11
		xorg.libXext
		xorg.libXrender
		xorg.libXi
		xorg.libSM
		xorg.libICE
		xorg.libXau
		xorg.libXdmcp
		xorg.libxcb
		xorg.xcbutilimage
		xorg.xcbutilkeysyms
		xorg.xcbutilwm
		xorg.xcbutilrenderutil

		# Fonts/input
		fontconfig
		freetype
		libxkbcommon

		# Common deps
		glib
		zlib

		# Mesa drivers (software GL fallback & vendor libs)
		mesa

		# nix couldn't find these
		#xcbutilcursor  # libxcb-cursor.so.0, often needed by Qt’s xcb platform plugin

	];

	  # 1) Add the udev rules for ZSA devices
  services.udev.extraRules = ''
# Rules for Oryx web flashing and live training
KERNEL=="hidraw*", ATTRS{idVendor}=="16c0", MODE="0664", GROUP="plugdev"
KERNEL=="hidraw*", ATTRS{idVendor}=="3297", MODE="0664", GROUP="plugdev"

# Legacy rules for live training over webusb (Not needed for firmware v21+)
  # Rule for all ZSA keyboards
  SUBSYSTEM=="usb", ATTR{idVendor}=="3297", GROUP="plugdev"
  # Rule for the Moonlander
  SUBSYSTEM=="usb", ATTR{idVendor}=="3297", ATTR{idProduct}=="1969", GROUP="plugdev"
  # Rule for the Ergodox EZ
  SUBSYSTEM=="usb", ATTR{idVendor}=="feed", ATTR{idProduct}=="1307", GROUP="plugdev"
  # Rule for the Planck EZ
  SUBSYSTEM=="usb", ATTR{idVendor}=="feed", ATTR{idProduct}=="6060", GROUP="plugdev"

# Wally Flashing rules for the Ergodox EZ
ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789A]?", ENV{MTP_NO_PROBE}="1"
SUBSYSTEMS=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789ABCD]?", MODE:="0666"
KERNEL=="ttyACM*", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", MODE:="0666"

# Keymapp / Wally Flashing rules for the Moonlander and Planck EZ
SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE:="0666", SYMLINK+="stm32_dfu"
# Keymapp Flashing rules for the Voyager
SUBSYSTEMS=="usb", ATTRS{idVendor}=="3297", MODE:="0666", SYMLINK+="ignition_dfu"
  '';

  # Optional: some boards enumerate as ttyACM/USB serial; this helps avoid surprise perms
  # users.users.yourusername.extraGroups = [ "plugdev" "dialout" "uucp" ];

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#	 enable = true;
	#	 enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.05"; # Did you read the comment?
}
