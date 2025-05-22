{

  outputs =
    {
      nixpkgs,
      home-manager,
      rust-overlay,
      self,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      # whitelisting unfree software
      unfree = [
        "steam"
        "obsidian"
      ];
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfreePredicate = (
          pkg: builtins.elem (pkg.pname or (builtins.parseDrvName pkg.name).name) unfree
        );
      };

    in
    {

      # NIXOS (root) configuration
      nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          baseColors = import ./colors/catppuccin-mocha.nix;
        };
        inherit pkgs;
        modules = [
          ./nixos/configuration.nix
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [ rust-overlay.overlays.default ];
              environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
            }
          )
        ];
      };

      # Home Manager (user) configuration
      homeConfigurations.johan = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {
          inherit inputs self;
          baseColors = import ./colors/catppuccin-mocha.nix;
          wallpaperPath = import ./wallpaper;
        };
        # pkgs = nixpkgs.legacyPackages."${system}";
        inherit pkgs;
        modules = [
          ./home-manager/home.nix
          inputs.nixvim.homeManagerModules.nixvim
          inputs.catppuccin.homeModules.catppuccin
        ];
      };
    };

  description = "Johan's NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    catppuccin.url = "github:catppuccin/nix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "unstable";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

}
