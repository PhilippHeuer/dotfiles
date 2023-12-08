{
  pkgs,
  lib,
  ...
}: {
  # bash
  programs.bash = {
    enable = true;
    initExtra = ''
      # source dotfiles
      if [ -f ~/.config/bash/init.sh ]; then
        source ~/.config/bash/init.sh
      fi
    '';
  };
}
