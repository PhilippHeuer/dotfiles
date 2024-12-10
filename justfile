_default:
	@just -l

# format
format:
	find nix -name "*.nix" -type f -exec nixfmt -w 200 {} \;

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
	rsync -a --delete $(pwd)/* laptop:~/dotfiles
	ssh -t laptop "cd ~/dotfiles/nix && sudo nixos-rebuild switch --flake path:.#laptop"

clean-laptop:
	ssh -t laptop "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 30d"
	ssh -t laptop "sudo nix-store --gc"

# desktop
apply-desktop:
	rsync -a --delete $(pwd)/* desktop:~/dotfiles
	ssh -t desktop "cd ~/dotfiles/nix && sudo nixos-rebuild switch --flake path:.#desktop"

clean-desktop:
	ssh -t desktop "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 30d"
	ssh -t desktop "sudo nix-store --gc"

# vault
apply-vault:
	rsync -a --delete $(pwd)/* vault:~/dotfiles
	ssh -t vault "cd ~/dotfiles/nix && sudo nixos-rebuild switch --flake path:.#vault"

clean-vault:
	ssh -t vault "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 30d"
	ssh -t vault "sudo nix-store --gc"

# mhd
apply-mhd:
	rsync -a --delete $(pwd)/* mhd:~/dotfiles
	ssh -t mhd "cd ~/dotfiles/nix && sudo nixos-rebuild switch --flake path:.#mhd"

clean-mhd:
	ssh -t mhd "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 30d"
	ssh -t mhd "sudo nix-store --gc"
