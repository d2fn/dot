{ ... }:
{
  services.openssh = {
    enable = true;
    authorizedKeysInHomedir = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };
  networking.firewall.allowedTCPPorts = [ 22 ];
}
