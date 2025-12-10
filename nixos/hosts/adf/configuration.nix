{ config, pkgs, ... }:

{
  networking.hostName = "adf";
  time.timeZone = "America/Chicago";
  users.users.d = {
    isNormalUser = true;
    description = "Dietrich Featherston";
    extraGroups = [
      "networkmanager"
      "wheel"
      "plugdev"
      "video"
      "render"
    ];
    packages = with pkgs; [
      #	thunderbird
    ];
  };

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
      vaapiIntel
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

}
