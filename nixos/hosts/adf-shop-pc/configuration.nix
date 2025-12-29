{ config, pkgs, ... }:

{
  networking.hostName = "adf-shop-pc";
  time.timeZone = "America/Chicago";
  users.users.d = {
    isNormalUser = true;
    description = "Dietrich Featherston";
    extraGroups = [
      "kvm"
      "libvirtd"
      "networkmanager"
      "plugdev"
      "render"
      "video"
      "wheel"
    ];
    packages = with pkgs; [
    ];
  };

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  virtualisation = {
    libvirtd = {
      enable = true;
      # uncomment when my channel adds this
      #networks.default = {
      #	enable = true;
      #	autostart = true;
      #};
      qemu = {
        runAsRoot = true;
        package = pkgs.qemu_kvm;
      };
    };
    # Needed for booting modern VMs (UEFI)
    spiceUSBRedirection.enable = true;
  };

  security.polkit.enable = true;

  hardware.enableRedistributableFirmware = true;
  boot.kernelModules = [
    "kvm"
    "kvm_intel"
    "kvm_amd"
  ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  # If your channel has hardware.graphics, this is the newer alias:
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libvdpau-va-gl
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD"; # try iHD first; fallback to i965 if needed
    NIXOS_OZONE_WL = "1"; # Wayland hint for Brave/Chromium
  };

  networking.hosts = {
    "127.0.0.1" = [
      "adf-host"
    ];
  };

  system.stateVersion = "25.05";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
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

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # support for auto mounting usb
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  programs.dconf.enable = true;

  # airplay printing
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip ];
    browsing = true;
    allowFrom = [ "all" ];
    defaultShared = true;
  };

  networking.firewall.allowedTCPPorts = [ 631 ];
  networking.firewall.allowedUDPPorts = [ 5353 ];

}
