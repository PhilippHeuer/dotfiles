{ pkgs, ... }:

{
  environment.systemPackages = [
    #pkgs.ansible
    (pkgs.python313.withPackages (pp: [
      pp.ansible
      pp.ansible-core
      pp.pywinrm # Windows Remote Management
    ]))
    pkgs.ansible-lint
  ];
}
