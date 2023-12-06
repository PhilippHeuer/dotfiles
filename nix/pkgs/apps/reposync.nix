{ lib
, stdenv
, installShellFiles
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "reposync";
  version = "v0.3.0";

  src = fetchFromGitHub {
    owner = "cidverse";
    repo = "reposync";
    rev = version;
    sha256 = "sha256-g7FqZ9bGj8cZoUJYwXnN4jvPggfNn7s0m9EzAFP2T/c=";
  };
  vendorHash = "sha256-JhdDUAtpGpjhwHn71BkufYUu/Eo336uC/0XWNtzVm9g=";

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
