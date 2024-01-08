# add custom ca certs
{ ... }:

{
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
}
