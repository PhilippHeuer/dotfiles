{
  pkgs,
  pkgs-unstable,
  inputs,
  lib,
  ...
}:

let
  buildTheme = { name, version, src, themeIni ? [] }:
    pkgs.stdenv.mkDerivation rec {
      pname = "sddm-theme-${name}";
      inherit version src;

      buildCommand = ''
        dir=$out/share/sddm/themes/${name}
        doc=$out/share/doc/${pname}

        mkdir -p $dir $doc
        if [ -d $src/${name} ]; then
          srcDir=$src/${name}
        else
          srcDir=$src
        fi
        cp -r $srcDir/* $dir/
        for f in $dir/{AUTHORS,COPYING,LICENSE,README,*.md,*.txt}; do
          test -f $f && mv $f $doc/
        done
        chmod 644 $dir/theme.conf

        ${lib.concatMapStringsSep "\n" (e: ''
          ${pkgs.crudini}/bin/crudini --set --inplace $dir/theme.conf "${e.section}" "${e.key}" "${e.value}"
        '') themeIni}
      '';
    };

  themes = rec {
    astronaut-win = {
      pkg = rec {
        name = "astronaut-win";
        version = "20240606";
        src = pkgs.fetchFromGitHub {
          owner = "Keyitdev";
          repo = "sddm-astronaut-theme";
          rev = "c10bd950544036c7418e0f34cbf1b597dae2b72f";
          sha256 = "sha256-kXovz813BS+Mtbk6+nNNdnluwp/7V2e3KJLuIfiWRD0=";
        };
        themeIni = [
          {section = "General"; key = "background"; value = "${inputs.nixpkgs-philippheuer.packages.${pkgs.system}.wallpapers}/share/backgrounds/catppuccin-mocha/nice-blue-background.png";}

          {section = "General"; key = "Font"; value = "JetBrainsMono Nerd Font Mono";}
          {section = "General"; key = "FontSize"; value = "12";}

          {section = "General"; key = "FormPosition"; value = "left";}
          {section = "General"; key = "FullBlur"; value = "false";}
          {section = "General"; key = "PartialBlur"; value = "true";}
          {section = "General"; key = "BlurRadius"; value = "80";}

          {section = "General"; key = "ForceHideVirtualKeyboardButton"; value = "true";}
        ];
      };
      deps = with pkgs; [
        inputs.nixpkgs-philippheuer.packages.${pkgs.system}.wallpapers
      ];
    };
  };
  theme = themes.astronaut-win;

in {
  # sddm settings
  services.displayManager.sddm = {
    enable = true;
    theme = theme.pkg.name;
    package = lib.mkForce pkgs.kdePackages.sddm; # qt6 sddm version
    wayland.enable = true;
    enableHidpi = true;
    settings.Theme.CursorTheme = "Bibata-Modern-Ice";
  };

  # sddm themes
  environment.systemPackages = [(buildTheme theme.pkg)] ++ theme.deps;
}
