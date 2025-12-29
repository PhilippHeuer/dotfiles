{
  pkgs,
  ...
}:

{
  # epub editor - https://github.com/Sigil-Ebook/Sigil
  environment.systemPackages = [
    pkgs.sigil
  ];
}
