# proxy
{ ... }:

let
  # config
  proxy = {
    enable = false;
    https = "https://localhost:3128";
    noProxy = "127.0.0.1,::1,localhost,.local";
  };

  proxySettings =
    if proxy.enable then
      {
        # system proxy
        proxy = {
          default = proxy.https;
          noProxy = proxy.noProxy;
        };

        # environment variables for applications that ignore the system proxy
        environment = {
          # electron-based applications
          ELECTRON_GET_USE_PROXY = "true";
          GLOBAL_AGENT_HTTPS_PROXY = proxy.https;
        };
      }
    else
      {
        # defaults
        proxy = {
          default = "";
          noProxy = "";
        };
        environment = { };
      };
in
{
  # apply proxy settings
  networking.proxy = proxySettings.proxy;

  # apply environment variables
  environment.variables = proxySettings.environment;
}
