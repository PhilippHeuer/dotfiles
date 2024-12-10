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
    JAVA_21_HOME = jdk21.outPath;
    JAVA_17_HOME = jdk17.outPath;
    JAVA_11_HOME = jdk11.outPath;
  };
}
