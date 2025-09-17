{
  pkgs,
  pkgs-unstable,
  inputs,
  lib,
  ...
}:

let
  buildTheme = { name, version, src, themeIni ? [], themeConfPath ? "theme.conf" }:
    pkgs.stdenvNoCC.mkDerivation rec {
      pname = "sddm-theme-${name}";
      inherit version src;

      dontWrapQtApps = true;
      propagatedBuildInputs = [
        pkgs.kdePackages.qtsvg
        pkgs.kdePackages.qtmultimedia
        pkgs.kdePackages.qtvirtualkeyboard
        pkgs.ffmpeg-headless
      ];

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

        if [ "${themeConfPath}" != "theme.conf" ]; then
          cp $dir/${themeConfPath} $dir/theme.conf
        fi

        for f in $dir/{AUTHORS,COPYING,LICENSE,README,*.md,*.txt}; do
          test -f $f && mv $f $doc/
        done
        chmod 644 $dir/theme.conf

        ${pkgs.gnused}/bin/sed -i "s|^ConfigFile=.*|ConfigFile=theme.conf|" "$dir/metadata.desktop"

        ${lib.concatMapStringsSep "\n" (e: ''
          ${pkgs.crudini}/bin/crudini --set --inplace $dir/theme.conf "${e.section}" "${e.key}" "${e.value}"
        '') themeIni}
      '';
    };

  themes = rec {
    astronaut-win = {
      pkg = rec {
        name = "astronaut-win";
        version = "1.0.75";
        src = pkgs.fetchFromGitHub {
          owner = "Keyitdev";
          repo = "sddm-astronaut-theme";
          rev = "c10bd950544036c7418e0f34cbf1b597dae2b72f";
          hash = "sha256-ITufiMTnSX9cg83mlmuufNXxG1dp9OKG90VBZdDeMxw=";
        };

        themeIni = [
          {section = "General"; key = "Background"; value = "${inputs.nixpkgs-philippheuer.packages.${pkgs.system}.wallpapers}/share/backgrounds/catppuccin-mocha/nice-blue-background.png";}

          {section = "General"; key = "Font"; value = "JetBrainsMono Nerd Font Mono";}
          {section = "General"; key = "FontSize"; value = "12";}

          {section = "General"; key = "FormPosition"; value = "left";}
          {section = "General"; key = "FullBlur"; value = "false";}
          {section = "General"; key = "PartialBlur"; value = "true";}

          {section = "General"; key = "HideVirtualKeyboard"; value = "true";}
        ];
        themeConfPath = "Themes/astronaut.conf";
      };
      deps = with pkgs; [
        inputs.nixpkgs-philippheuer.packages.${pkgs.system}.wallpapers
      ];
    };
    silent-sddm = {
      pkg = rec {
        name = "silent-sddm";
        version = "1.3.5";
        src = pkgs.fetchFromGitHub {
          owner = "uiriansan";
          repo = "SilentSDDM";
          rev = "v1.3.5";
          hash = "sha256-R0rvblJstTgwKxNqJQJaXN9fgksXFjPH5BYVMXdLsbU=";
        };

        themeIni = [];
        themeConfPath = "configs/silvia.conf";
      };
      deps = with pkgs; [
        inputs.nixpkgs-philippheuer.packages.${pkgs.system}.wallpapers
      ];
    };
  };
  theme = themes.astronaut-win;
  themePkg = (buildTheme theme.pkg);

in {
  # sddm settings
  qt.enable = true;
  services.displayManager.sddm = {
    enable = true;
    theme = theme.pkg.name;
    package = lib.mkForce pkgs.kdePackages.sddm; # qt6 sddm version
    wayland.enable = true;
    enableHidpi = true;
    extraPackages = themePkg.propagatedBuildInputs;
    settings = {
      General = {
        InputMethod = "qtvirtualkeyboard";
      };
      Theme = {
        CursorTheme = "Bibata-Modern-Ice";
      };
    };
  };

  # sddm themes
  environment.systemPackages = [themePkg] ++ theme.deps;
}
