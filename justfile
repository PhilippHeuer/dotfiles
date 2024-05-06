_default:
	@just -l

# tasks
update:
	cd nix && sudo nix flake update

# wsl
apply-wsl: 
	cd nix && sudo nixos-rebuild switch --flake path:.#wsl

clean-wsl:
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 3d
	sudo nix-store --gc

# laptop
apply-laptop:
	rsync -a $(pwd)/* laptop:~/dotfiles
	rsync -a ~/.local/share/backgrounds/* laptop:~/.local/share/backgrounds
	ssh -t laptop "cd ~/dotfiles/nix && sudo nixos-rebuild switch --flake path:.#laptop"

clean-laptop:
	ssh -t laptop "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 30d"
	ssh -t laptop "sudo nix-store --gc"

# desktop
apply-desktop:
	rsync -a $(pwd)/* desktop:~/dotfiles
	rsync -a ~/.local/share/backgrounds/* desktop:~/.local/share/backgrounds
	ssh -t desktop "cd ~/dotfiles/nix && sudo nixos-rebuild switch --flake path:.#desktop"

# vault
apply-vault:
	rsync -a $(pwd)/* vault:~/dotfiles
	ssh -t vault "cd ~/dotfiles/nix && sudo nixos-rebuild switch --flake path:.#vault"

clean-vault:
	ssh -t vault "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 30d"
	ssh -t vault "sudo nix-store --gc"

# utilities
perms:
	git ls-tree -r --name-only $(git write-tree) | while read filename; do if [[ -x "$filename" ]]; then echo "+x $filename" && chmod +x "$filename"; fi; done
