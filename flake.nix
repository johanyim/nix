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

  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    {

      nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          baseColors = import ./colors/catppuccin-mocha.nix;
        };
        system = "x86_64-linux";
        modules = [
          ./nixos/configuration.nix
          inputs.nixvim.nixosModules.nixvim
        ];
      };

      homeConfigurations.johan = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {
          inherit inputs;
          baseColors = import ./colors/catppuccin-mocha.nix;
        };
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [ ./home-manager/home.nix ];
      };
    };
}
