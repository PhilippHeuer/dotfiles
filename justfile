_default:
	@just -l

update:
	cd nix && sudo nix flake update

apply-wsl: 
	cd nix && sudo nixos-rebuild switch --flake path:.#wsl
