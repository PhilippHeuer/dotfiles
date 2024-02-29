_default:
	@just -l

# local
update:
	cd nix && sudo nix flake update

apply-wsl: 
	cd nix && sudo nixos-rebuild switch --flake path:.#wsl

clean:
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 3d
	sudo nix-store --gc

# vault
apply-vault:
	rsync -a $(pwd)/* vault:~/dotfiles
	ssh -t vault "cd ~/dotfiles/nix && sudo nixos-rebuild switch --flake path:.#vault"

clean-vault:
	ssh -t vault "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 3d"
	ssh -t vault "sudo nix-store --gc"

# utilities
perms:
	git ls-tree -r --name-only $(git write-tree) | while read filename; do if [[ -x "$filename" ]]; then echo "+x $filename" && chmod +x "$filename"; fi; done
