{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		wgnord
		wireguard-tools
	];
}

{ config, pkgs, lib, ... }:

let
  wgnordTemplate = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/phirecc/wgnord/master/template.conf";
    # run:
    #   nix-prefetch-url https://raw.githubusercontent.com/phirecc/wgnord/master/template.conf
    # and paste the hash here:
    sha256 = "sha256-04acb0a4d0e9df4ece03219c3e563843fa49fafd8a2d582506591b52f08315c2";
  };
in
{
  # Install the CLI
  environment.systemPackages = [
    pkgs.wgnord
		pkgs.wireguard-tools
  ];

  # Make sure the state dir exists
  systemd.tmpfiles.rules = [
    "d /var/lib/wgnord 0755 root root -"
  ];

  # Drop the template.conf into /var/lib/wgnord on each switch
  system.activationScripts.wgnordTemplate = ''
    #!${pkgs.runtimeShell}
    mkdir -p /var/lib/wgnord
    cp ${wgnordTemplate} /var/lib/wgnord/template.conf
    chmod 0644 /var/lib/wgnord/template.conf
  '';
}

