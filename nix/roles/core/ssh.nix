{ pkgs, ... }:

{
  # ssh agent
  programs.ssh = {
    startAgent = true;
    agentTimeout = "12h";
  };

  # gpg agent (supports SSH Keys and GPG Keys)
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false; # will set SSH_AUTH_SOCK
    enableBrowserSocket = false;
    settings = {
      default-cache-ttl = 3600; # 1 hour
      default-cache-ttl-ssh = 3600; # 1 hour
    };
  };
}
