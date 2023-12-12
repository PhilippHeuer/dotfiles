{ lib, ... }:

{
  services.openssh = {
    # enable sshd server
    enable = true;

    # require public key authentication for better security
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;

    # disable root login
    settings.PermitRootLogin = "no";
  };
}
