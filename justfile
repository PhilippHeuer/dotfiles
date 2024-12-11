_default:
	@just -l

format:
	find nix -name "*.nix" -type f -exec nixfmt -w 200 {} \;

update: nix-update nvim-update

nix-update:
	cd nix && sudo nix flake update

nvim-update:
	nvim --headless "+Lazy! update" +qa

apply-local +PROFILE:
	cd nix && sudo nixos-rebuild switch --flake path:.#{{PROFILE}}

apply-to +HOST:
	rsync -a --delete $(pwd)/* {{HOST}}:~/dotfiles
	ssh -t {{HOST}} "cd ~/dotfiles/nix && sudo nixos-rebuild switch --flake path:.#{{HOST}}"

gc:
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 3d
	sudo nix-store --gc
