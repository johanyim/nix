{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./modules
  ];

  home = {
    username = "johan";
    homeDirectory = "/home/johan";
    stateVersion = "23.11";
    packages = with pkgs; [
      dconf
      neofetch
      htop
      hyprpaper
      bat
      bottom
      nvimpager

      (import ./scripts/hms.nix { inherit pkgs; })
    ];
  };

  programs.mpv = {
    enable = true;
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
