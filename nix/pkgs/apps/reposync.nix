{ lib
, stdenv
, installShellFiles
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "reposync";
  version = "v0.4.0-alpha.1";

  src = fetchFromGitHub {
    owner = "cidverse";
    repo = "reposync";
    rev = version;
    sha256 = "sha256-Tl5TZUEkByUWlGhG2qfkz2i1PiUQ24N1eYJcUwFYUTE=";
  };
  vendorHash = "sha256-l8bc6FzwooRMXEcQvCYUCzlM3g0wQ+eFrpEuCaQxziw=";

  ldflags = [
    "-X main.Version=${version}"
    "-X main.CommitHash=none"
    "-X main.RepositoryStatus=clean"
    "-X main.BuildAt=none"
  ];

  nativeBuildInputs = [
    installShellFiles
  ];

  # disable checks
  doCheck = false;

  # completions
  postInstall = ''
      # install shell completion
      installShellCompletion --cmd reposync \
        --bash <($out/bin/reposync completion bash) \
        --fish <($out/bin/reposync completion fish) \
        --zsh  <($out/bin/reposync completion zsh)
    '';

  # metadata
  meta = with lib; {
    homepage = "https://github.com/cidverse/reposync";
    description = "reposync";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ ];
    mainProgram = "reposync";
  };
}
