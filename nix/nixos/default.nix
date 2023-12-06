{
  default = {
    imports = [
      ./base.nix
      #./user.nix
      ./locale.nix
      ./fonts.nix
      ./nixconfig.nix
    ];
  };

  #gnome = {
  #  imports = [./desktop/gnome.nix];
  #};
#
  #kde = {
  #  imports = [./desktop/kde.nix];
  #};
#
  #sway = {
  #  imports = [
  #    ./desktop/wm.nix
  #    ./desktop/wm-sway.nix
  #  ];
  #};
#
  #hyprland = {
  #  imports = [
  #    ./desktop/wm.nix
  #    ./desktop/wm-hyprland.nix
  #  ];
  #};
}
