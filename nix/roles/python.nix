{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # python312
    (
      python311.withPackages(ps: with ps; [
        pyyaml # some of the python scripts require yaml
        inquirer # select ui for python scripts
      ]
    ))
  ];
}
