{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ ./modules/bundle.nix ];

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

  programs.git = {
    enable = true;
    userName = "johanyim";
    userEmail = "johanjyyim@gmail.com";
  };

}
