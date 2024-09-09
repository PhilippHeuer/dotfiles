{ ... }:

{
  services.openssh = {
    # enable sshd server
    enable = true;

    settings = {
      # require public key authentication for better security
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;

      # disable root login
      PermitRootLogin = "no";

      # limit the number of authentication attempts
      MaxAuthTries = 10;
    };
  };
}
