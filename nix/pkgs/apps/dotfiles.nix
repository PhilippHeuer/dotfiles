{ lib
, stdenv
, installShellFiles
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "dotfiles-cli";
  version = "v0.2.1";

  src = fetchFromGitHub {
    owner = "PhilippHeuer";
    repo = "dotfiles-cli";
    rev = version;
    sha256 = "sha256-jVACH9JJBZNRwRyWTSxACiqM3I7iyfPWY51qbfQ9fyg=";
  };
  vendorHash = "sha256-xgSJcdyl562rfJnTZhnnZZcs6mH63gM7muFEbJ+CSHs=";

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
