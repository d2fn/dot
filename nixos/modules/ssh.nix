{ ... }:
{
  services.openssh = {
    enable = true;
    authorizedKeysInHomedir = true;
    settings = {
      AllowUsers = [ "d" ];
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      MaxAuthTries = 3;
      LoginGraceTime = "20s";
    };
  };

  users.users.d.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJxWibcEp0Rk1ca2H6+YT4mMS4SkxY1ttQxvXBM48MU0 adf-x220"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIrHRqUDbmwT3LBVmaex76j+OOps6r6riHK/oQQxa4tI adf-t480"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKXXBKD0/1cADMoPZkjFZH5iECq6PuyX+gWQ+dNwlPcX adfhost"
  ];

  networking.firewall.allowedTCPPorts = [ 22 ];
}
