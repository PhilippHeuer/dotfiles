{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.ansible
    pkgs.ansible-lint
    /*
    (pkgs.python313.withPackages (pp: [
      pp.ansible
      pp.ansible-core
      pkgs.ansible-lint
      pp.pywinrm # Windows Remote Management
    ]))
    */
  ];
}
