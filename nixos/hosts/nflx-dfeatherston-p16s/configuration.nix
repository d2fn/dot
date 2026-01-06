{ config, pkgs, ... }:

{
  networking.hostName = "nflx-dfeatherston-p16s";
  time.timeZone = "America/Los_Angeles";
  users.users.d = {
    isNormalUser = true;
    description = "Dietrich Featherston";
    extraGroups = [
      "kvm"
      "libvirtd"
      "docker"
      "networkmanager"
      "plugdev"
      "tss"
      "wheel"
    ];
  };
  users.groups.tss = { };

  virtualisation = {
    docker.enable = true;
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

  hardware.enableRedistributableFirmware = true;
  boot.kernelModules = [
    "kvm"
    "kvm_intel"
    "kvm_amd"
  ];

  security.tpm2 = {
    enable = true;
    abrmd.enable = false;
    tssUser = "tss";
  };

  system.stateVersion = "25.05";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
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
