# locale
#
{ lib, ... }:

{
  # time zone
  time.timeZone = lib.mkDefault "Europe/Berlin";

  # language
  i18n = {
    # system language
    defaultLocale = lib.mkDefault "en_US.UTF-8";

    # locale settings
    extraLocaleSettings = {
      LC_ADDRESS = lib.mkDefault "de_DE.UTF-8";
      LC_IDENTIFICATION = lib.mkDefault "de_DE.UTF-8";
      LC_MEASUREMENT = lib.mkDefault "de_DE.UTF-8";
      LC_MONETARY = lib.mkDefault "de_DE.UTF-8";
      LC_NAME = lib.mkDefault "de_DE.UTF-8";
      LC_NUMERIC = lib.mkDefault "de_DE.UTF-8";
      LC_PAPER = lib.mkDefault "de_DE.UTF-8";
      LC_TELEPHONE = lib.mkDefault "de_DE.UTF-8";
      LC_TIME = lib.mkDefault "de_DE.UTF-8";
    };

    # supported locales
    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
      "de_DE.UTF-8/UTF-8"
    ];
  };

  # console keymap
  console.keyMap = "de";
}
