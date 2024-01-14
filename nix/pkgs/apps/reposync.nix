{ lib
, stdenv
, installShellFiles
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "reposync";
  version = "v0.4.0";

  src = fetchFromGitHub {
    owner = "cidverse";
    repo = "reposync";
    rev = version;
    sha256 = "sha256-K7MZqiPe8+9dfUq3zMYf4cx91oU2XarOUxZ6KGZtrcw=";
  };
  vendorHash = "sha256-iYLJaNmgczYT6bmF1lgES24w4xy6ejE9t81wHo7ecTE=";

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
