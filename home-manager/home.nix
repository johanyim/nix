{ config, lib, pkgs, inputs, ...}: {
	imports = [
		./modules/bundle.nix	
	];

	home = {
		username = "johan";
		homeDirectory = "/home/johan";
		stateVersion = "23.11";
		packages = with pkgs; [
			neofetch
			htop
			hyprpaper
		];
	};

	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch";
		};
	};

	programs.git = {
		enable = true;
		userName = "johanyim";
		userEmail = "johanjyyim@gmail.com";
	};


	
}
