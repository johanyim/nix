{
  outputs =
    {
      nixpkgs,
      home-manager,
      self,
      ...
    }@inputs:
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
          inherit inputs self;
          baseColors = import ./colors/catppuccin-mocha.nix;
          wallpaperPath = import ./wallpaper;
        };

        pkgs = nixpkgs.legacyPackages."${system}";

        modules = [
          ./home-manager/home.nix
          inputs.nixvim.homeManagerModules.nixvim
          inputs.catppuccin.homeModules.catppuccin
        ];
      };
    };

  description = "my nix config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    catppuccin.url = "github:catppuccin/nix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "unstable";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

}
