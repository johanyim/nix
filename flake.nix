{
  description = "my nix config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {

      nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          baseColors = import ./colors/catppuccin-mocha.nix;
        };
        modules = [ ./nixos/configuration.nix ];
      };

      homeConfigurations.johan = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {
          inherit inputs;
          baseColors = import ./colors/catppuccin-mocha.nix;
        };
        pkgs = nixpkgs.legacyPackages."${system}";
        modules = [
          ./home-manager/home.nix
          inputs.nixvim.homeManagerModules.nixvim
        ];
      };
    };
}
