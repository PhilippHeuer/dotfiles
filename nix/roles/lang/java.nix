{ pkgs, pkgs-unstable, ... }:

let
  jdk21 = pkgs-unstable.jdk21;
  jdk17 = pkgs-unstable.jdk17;
  jdk11 = pkgs-unstable.jdk11;
in
{
  environment.systemPackages = [
    jdk21
    jdk17
    jdk11
  ];

  environment.variables = {
    JAVA_HOME_21 = jdk21.outPath;
    JAVA_HOME_17 = jdk17.outPath;
    JAVA_HOME_11 = jdk11.outPath;
  };

  system.activationScripts.jdkSymlinks.text = ''
    mkdir -p /opt/java

    ln -sf ${jdk21} /opt/java/jdk-21
    ln -sf ${jdk17} /opt/java/jdk-17
    ln -sf ${jdk11} /opt/java/jdk-11
  '';
}
