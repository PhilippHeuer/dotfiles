# add custom ca certs
{ config, pkgs, system, lib, ... }:

let
  caBundle = config.environment.etc."ssl/certs/ca-certificates.crt".source;
  p11kit = pkgs.p11-kit.overrideAttrs (oldAttrs: {
    mesonFlags = [
      "--sysconfdir=/etc"
      (lib.mesonEnable "systemd" false)
      (lib.mesonOption "bashcompdir" "${placeholder "bin"}/share/bash-completion/completions")
      (lib.mesonOption "trust_paths" (lib.concatStringsSep ":" [
        "${caBundle}"
      ]))
    ];
  });
  javaCaCerts = derivation {
    name = "java-cacerts";
    builder = pkgs.writeShellScript "java-cacerts-builder" ''
      ${p11kit.bin}/bin/trust \
        extract \
        --format=java-cacerts \
        --purpose=server-auth \
        $out
    '';
    inherit system;
    outputs = [ "out" ];
  };
in {
  security = {
    pki = {
      installCACerts = true;

      # append trusted certificate authorities
      certificates = [
        #''
        #  NixOS.org
        #  =========
        #  -----BEGIN CERTIFICATE-----
        #  MIIGUDCCBTigAwIBAgIDD8KWMA0GCSqGSIb3DQEBBQUAMIGMMQswCQYDVQQGEwJJ
        #  TDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0
        #  -----END CERTIFICATE-----
        #''
      ];

      # blacklist untrusted certificate authorities
      caCertificateBlacklist = [
      ];
    };
  };

  environment.variables = {
    JAVAX_NET_SSL_TRUSTSTORE = javaCaCerts.outPath;
    JAVA_TOOL_OPTIONS = "-Djavax.net.ssl.trustStore=${javaCaCerts.outPath}";
  };
}
