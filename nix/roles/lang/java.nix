{ pkgs, pkgs-unstable, ... }:

let
  jdk21 = pkgs-unstable.jdk21;
  jdk17 = pkgs-unstable.jdk17;
in
{
  environment.systemPackages = [
    jdk21
    jdk17
  ];

  environment.variables = {
    JAVA_HOME_21 = jdk21.outPath;
    JAVA_HOME_17 = jdk17.outPath;
  };

  system.activationScripts.jdkSymlinks.text = ''
    mkdir -p /opt/java

    if [ "$(readlink /opt/java/jdk-21)" != "${jdk21}/lib/openjdk" ]; then
      rm /opt/java/jdk-21 || true
      ln -s "${jdk21}/lib/openjdk" /opt/java/jdk-21
    fi

    if [ "$(readlink /opt/java/jdk-17)" != "${jdk17}/lib/openjdk" ]; then
      rm /opt/java/jdk-17 || true
      ln -s "${jdk17}/lib/openjdk" /opt/java/jdk-17
    fi
  '';
}
