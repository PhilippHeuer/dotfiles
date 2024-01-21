_default:
	@just -l

apply-wsl: 
	cd nix && sudo nixos-rebuild switch --flake path:.#wsl
