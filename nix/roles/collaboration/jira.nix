{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.jira-cli-go
  ];
}
