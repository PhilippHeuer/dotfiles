{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

{
  programs.firefox = {
    enable = true;
    package = pkgs-unstable.wrapFirefox pkgs-unstable.firefox-unwrapped {
      extraPolicies = {
        # telemetry
        DisableTelemetry = true;

        # setup
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };

        # disable captive portal detection
        CaptivePortal = false;

        # disable other unwanted features
        DisableFirefoxStudies = true;
        DisablePocket = true;
        FirefoxHome = {
          Pocket = false;
          Snippets = false;
        };

        # enable importing system certificates (/usr/lib64/mozilla/certificates)
        ImportEnterpriseRoots = true;

        # extension settings
        ExtensionSettings = { };
      };
    };
    preferences = {
      # green https icon
      "security.secure_connection_icon_color_gray" = false;

      # file picker
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
  };

  programs.firejail.wrappedBinaries.firefox = {
    executable = "${lib.getBin pkgs.firefox}/bin/firefox";
    profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
  };

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1"; # wayland support
    MOZ_USE_XINPUT2 = "1"; # improved touchpad scrolling
    MOZ_DBUS_REMOTE = "1"; # dbus
  };

  # set firefox as the default browser
  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
  };
}
