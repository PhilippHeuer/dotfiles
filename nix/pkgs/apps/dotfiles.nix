{ lib
, stdenv
, installShellFiles
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "dotfiles-cli";
  version = "v0.2.0";

  src = fetchFromGitHub {
    owner = "PhilippHeuer";
    repo = "dotfiles-cli";
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
      mv $out/bin/* $out/bin/dotfiles

      # install shell completion
      installShellCompletion --cmd dotfiles \
        --bash <($out/bin/dotfiles completion bash) \
        --fish <($out/bin/dotfiles completion fish) \
        --zsh  <($out/bin/dotfiles completion zsh)
    '';

  # metadata
  meta = with lib; {
    homepage = "https://github.com/PhilippHeuer/dotfiles-cli";
    description = "dotfiles-cli";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ ];
    mainProgram = "dotfiles";
  };
}
