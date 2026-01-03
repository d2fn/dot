{
  pkgs,
  ...
}:

let
  wgnordTemplate = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/phirecc/wgnord/master/template.conf";
    # run:
    #   nix-prefetch-url https://raw.githubusercontent.com/phirecc/wgnord/master/template.conf
    # and paste the hash here:
    sha256 = "1hhmhgq546sr0qjmhbcazpx4kyj371b3x7110g74xpz9s2jb1b04";
  };
in
{

  networking.resolvconf.enable = false;
  services.resolved.enable = true;
  networking.networkmanager.dns = "systemd-resolved";

  environment.systemPackages = with pkgs; [
    wgnord
    wireguard-tools

    # wgnord insists on calling `resolvconf`. On NixOS we use systemd-resolved.
    # Provide a no-op resolvconf so wgnord doesn't abort after bringing up wg.
    (writeShellScriptBin "resolvconf" ''
      #!/usr/bin/env bash
      exit 0
    '')
  ];

  # Make sure the state dir exists
  systemd.tmpfiles.rules = [
    "d /var/lib/wgnord 0755 root root -"
    "d /etc/wireguard 0755 root root -"
  ];

  # Drop the template.conf into /var/lib/wgnord on each switch
  system.activationScripts.wgnordTemplate = ''
    #!${pkgs.runtimeShell}
    mkdir -p /var/lib/wgnord
    cp ${wgnordTemplate} /var/lib/wgnord/template.conf
    chmod 0644 /var/lib/wgnord/template.conf
  '';
}
