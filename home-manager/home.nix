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
    # nixpkgs.config.allowUnfree = true;
    packages = with pkgs; [
      dconf
      neofetch
      htop
      hyprpaper
      bat
      bottom
      nvimpager
      nh
      hwinfo
      obsidian

      grim
      slurp
      wl-clipboard

      vimiv-qt

      swappy

      (import ./scripts/hms.nix { inherit pkgs; })
      (import ./scripts/nrs.nix { inherit pkgs; })
      (import ./scripts/screenshot.nix { inherit pkgs; })
      (import ./scripts/screenshot-edit.nix { inherit pkgs; })
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
