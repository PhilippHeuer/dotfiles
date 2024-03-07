{ lib
, stdenv
, buildGoModule
, fetchgit
}:

buildGoModule rec {
  pname = "driveguard";
  version = "v0.1.0";

  src = fetchgit {
    url = "https://github.com/PhilippHeuer/driveguard.git";
    rev = "120973cef313eb7523d24d9dad9b8606bef2fa6b";
    hash = "sha256-1npjuMnpBQHk/7RTKwyOW/RyS9tq0XOPSctDUZh8WG8=";
  };
  vendorHash = "sha256-Gi3oYoxvQPfO7fTEWU4bYQX5pftPorb+1W5Sqi2ahFA=";

  ldflags = [
    "-X main.version=${version}"
    "-X main.commit=none"
    "-X main.date=none"
    "-X main.status=clean"
  ];

  # disable checks
  doCheck = false;

  # metadata
  meta = with lib; {
    homepage = "https://github.com/PhilippHeuer/driveguard";
    description = "DriveGuard will monitor drive health and automatically send notifications if any issues are detected.";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ ];
    mainProgram = "driveguard";
  };
}
