{ pkgs, pkgs-unstable, ... }:

let
  jdk25 = pkgs-unstable.jdk25;
  jdk21 = pkgs-unstable.jdk21;
  jdk17 = pkgs-unstable.jdk17;
in
{
  environment.systemPackages = [
    jdk25
    jdk21
    jdk17
  ];

  environment.variables = {
    JAVA_HOME_25 = jdk25.outPath;
    JAVA_HOME_21 = jdk21.outPath;
    JAVA_HOME_17 = jdk17.outPath;
  };

  system.activationScripts.jdkSymlinks.text = ''
    mkdir -p /opt/java

    if [ "$(readlink /opt/java/jdk-25)" != "${jdk25}/lib/openjdk" ]; then
      rm /opt/java/jdk-25 || true
      ln -s "${jdk25}/lib/openjdk" /opt/java/jdk-25
    fi

    if [ "$(readlink /opt/java/jdk-21)" != "${jdk21}/lib/openjdk" ]; then
      rm /opt/java/jdk-21 || true
      ln -s "${jdk21}/lib/openjdk" /opt/java/jdk-21
    fi

    if [ "$(readlink /opt/java/jdk-17)" != "${jdk17}/lib/openjdk" ]; then
      rm /opt/java/jdk-17 || true
      ln -s "${jdk17}/lib/openjdk" /opt/java/jdk-17
    fi
  '';

  # workaround for java awt on wayland
  environment.sessionVariables._JAVA_AWT_WM_NONREPARENTING = "1";
}
