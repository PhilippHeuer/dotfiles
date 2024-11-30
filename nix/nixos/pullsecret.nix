{ config, ... }:

{
  # read-only source pull secrets
  sops.secrets = {
    "github/username" = {
      sopsFile = ./../secrets/pullsecret.yaml;
      format = "yaml";
      restartUnits = [ "nix-daemon.service" ];
    };
    "github/password" = {
      sopsFile = ./../secrets/pullsecret.yaml;
      format = "yaml";
      restartUnits = [ "nix-daemon.service" ];
    };
    "gitlab/username" = {
      sopsFile = ./../secrets/pullsecret.yaml;
      format = "yaml";
      restartUnits = [ "nix-daemon.service" ];
    };
    "gitlab/password" = {
      sopsFile = ./../secrets/pullsecret.yaml;
      format = "yaml";
      restartUnits = [ "nix-daemon.service" ];
    };
  };

  # include daemon secrets, ! to bypass validation
  nix.extraOptions = ''
    !include ${config.sops.templates.impure-env-conf.path}
  '';

  # impure env vars with vcs credentials
  sops.templates.impure-env-conf.content = ''
    impure-env = NIX_GITHUB_PRIVATE_USERNAME=${
      config.sops.placeholder."github/username"
    } NIX_GITHUB_PRIVATE_PASSWORD=${
      config.sops.placeholder."github/password"
    } NIX_GITLAB_PRIVATE_USERNAME=${
      config.sops.placeholder."gitlab/username"
    } NIX_GITLAB_PRIVATE_PASSWORD=${config.sops.placeholder."gitlab/password"}
  '';
}
