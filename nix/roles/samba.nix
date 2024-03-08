{ pkgs, ... }:

{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      workgroup = WORKGROUP
      server string = smbnix
      netbios name = smbnix
      use sendfile = yes
      #hosts allow = 10.98.0. 127.0.0.1 localhost
      #hosts deny = 0.0.0.0/0
    '';
    shares = {
      main = {
        path = "/mnt";
        browseable = "yes";
        public = "no";
        writable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = "phx";
        "force user" = "phx";
      };
    };
  };
}
