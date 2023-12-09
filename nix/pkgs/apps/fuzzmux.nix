{ lib
, stdenv
, installShellFiles
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "fuzzmux";
  version = "v0.3.1";

  src = fetchFromGitHub {
    owner = "PhilippHeuer";
    repo = "fuzzmux";
    rev = version;
    sha256 = "sha256-vmfI0M98PPeksmQP0SwJMmIW2M3d24Xk8ElTeIDt/G0=";
  };
  vendorHash = "sha256-vENzC9TEFwGeDXKGGQgmc4E/VHRSUPUjvoS713K3af4=";

  ldflags = [
    "-X main.version=${version}"
    "-X main.commit=none"
    "-X main.date=none"
    "-X main.status=clean"
  ];

  nativeBuildInputs = [
    installShellFiles
  ];

  # disable checks
  doCheck = false;

  # completions
  postInstall = ''
      # rename binary
      mv $out/bin/* $out/bin/tmx

      # install shell completion
      installShellCompletion --cmd tmx \
        --bash <($out/bin/tmx completion bash) \
        --fish <($out/bin/tmx completion fish) \
        --zsh  <($out/bin/tmx completion zsh)
    '';

  # metadata
  meta = with lib; {
    homepage = "https://github.com/PhilippHeuer/fuzzmux";
    description = "fuzzmux";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ ];
    mainProgram = "tmx";
  };
}
