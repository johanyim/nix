{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./modules/bundle.nix
    # inputs.hyprland.homeManagerModules.default
    # inputs.nixvim.homeManagerModules.nixvim
  ];

  home = {
    username = "johan";
    homeDirectory = "/home/johan";
    stateVersion = "23.11";
    packages = with pkgs; [
      neofetch
      htop
      hyprpaper
      bat
      bottom
      inputs.zen-browser.packages."${system}".default
      # rofi-wayland
    ];
  };

  catppuccin.flavor = "mocha";
  catppuccin.gtk = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
    size = "standard";
    tweaks = [ "normal" ];
  };

  catppuccin.cursors = {
    enable = true;
    accent = "dark";
  };

  gtk = {
    enable = true;
  };

}
