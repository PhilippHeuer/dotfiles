{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    (pkgs.python312.withPackages (
      ps: with ps; [
        pyyaml # some of the python scripts require yaml
        inquirer # select ui for python scripts
        requests # http requests
      ]
    ))
    pkgs.pipenv
    pkgs-unstable.poetry
    pkgs-unstable.uv
  ];
}
