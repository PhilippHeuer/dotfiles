_default:
	@just -l

update:
	cd nix && sudo nix flake update

apply-wsl: 
	cd nix && sudo nixos-rebuild switch --flake path:.#wsl

perms:
	git ls-tree -r --name-only $(git write-tree) | while read filename; do if [[ -x "$filename" ]]; then echo "+x $filename" && chmod +x "$filename"; fi; done
