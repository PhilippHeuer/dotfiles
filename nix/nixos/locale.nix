# locale
#
{ lib, ... }:

let
  ENGLISH = "en_US.UTF-8";
  GERMAN = "de_DE.UTF-8";
in {
  # time zone
  time.timeZone = lib.mkDefault "Europe/Berlin";

  # language
  i18n = {
    # system language
    defaultLocale = ENGLISH;

    # locale settings
    extraLocaleSettings = {
      LANG = ENGLISH;
      LC_ADDRESS = GERMAN;
      LC_IDENTIFICATION = GERMAN;
      LC_MEASUREMENT = GERMAN;
      LC_MONETARY = GERMAN;
      LC_NAME = GERMAN;
      LC_NUMERIC = GERMAN;
      LC_PAPER = GERMAN;
      LC_TELEPHONE = GERMAN;
      LC_TIME = GERMAN;
    };

    # supported locales
    supportedLocales = [
      "${ENGLISH}/UTF-8"
      "${GERMAN}/UTF-8"
    ];
  };

  # x11 keymap
  services.xserver = {
    xkb = {
      layout = "de";
      variant = "nodeadkeys";
    };
  };

  # console keymap
  console.keyMap = "de-latin1-nodeadkeys";
}
