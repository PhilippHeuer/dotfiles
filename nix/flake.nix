#           ▜███▙       ▜███▙  ▟███▛
#            ▜███▙       ▜███▙▟███▛
#             ▜███▙       ▜██████▛
#      ▟█████████████████▙ ▜████▛     ▟▙
#     ▟███████████████████▙ ▜███▙    ▟██▙
#            ▄▄▄▄▖           ▜███▙  ▟███▛
#           ▟███▛             ▜██▛ ▟███▛
#          ▟███▛               ▜▛ ▟███▛
# ▟███████████▛                  ▟██████████▙
# ▜██████████▛                  ▟███████████▛
#       ▟███▛ ▟▙               ▟███▛
#      ▟███▛ ▟██▙             ▟███▛
#     ▟███▛  ▜███▙           ▝▀▀▀▀
#     ▜██▛    ▜███▙ ▜██████████████████▛
#      ▜▛     ▟████▙ ▜████████████████▛
#            ▟██████▙       ▜███▙
#           ▟███▛▜███▙       ▜███▙
#          ▟███▛  ▜███▙       ▜███▙
#          ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘
#
{
  description = "NixOS System Configuration";

  inputs = {
    # NixOS
    #
    # To update nixpkgs (and thus NixOS), pick the nixos-unstable rev from https://status.nixos.org/
    #
    # stable: github:nixos/nixpkgs/nixos-26.05
    # unstable: github:nixos/nixpkgs/nixos-unstable
    #
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    hardware.url = "github:nixos/nixos-hardware";

    # secureboot
    #lanzaboote = {
    #  url = "github:nix-community/lanzaboote/v1.0.0";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    # homemanager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # alternative registries
    nixpkgs-philippheuer = {
      url = "github:philippheuer/nixpkgs/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # jetbrains plugins
    nix-jetbrains-plugins = {
      url = "github:PhilippHeuer/nix-jetbrains-plugins";
    };

    # vscode marketplace
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # community
    impermanence.url = "github:nix-community/impermanence";

    # hyprland
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # sops
    sops = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # wsl
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL?rev=5482f113fd31ebac131d1ebeb2ae90bf0d5e41f5";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-wsl,
      sops,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib;
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (
        system:
        import nixpkgs {
          inherit system;

          # This value determines the NixOS release from which the default
          # settings for stateful data, like file locations and database versions
          # on your system were taken. It's perfectly fine and recommended to leave
          # this value at the release version of the first install of this system.
          # Before changing this value read the documentation for this option
          # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
          stateVersion = "24.11";

          # allow unfree packages
          config = {
            allowUnfree = true;
            allowUnfreePredicate = _: true;
          };
        }
      );
    in
    {
      inherit lib;

      # global nixos modules
      nixosModules = import ./nixos;

      # configurations
      nixosConfigurations = import ./configuration { inherit inputs outputs self; };
    };
}
