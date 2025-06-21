{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let

  ## import all scripts within the scripts directory
  scriptFiles = builtins.attrNames (builtins.readDir ./scripts);
  # scripts = import ./scripts { inherit pkgs; };
  scripts = builtins.map (file: import ./scripts/${file} { inherit pkgs inputs; }) scriptFiles;
in
{
  imports = [
    ./modules
  ];

  home = {
    username = "johan";
    homeDirectory = "/home/johan";
    stateVersion = "23.11";
    # nixpkgs.config.allowUnfree = true;
    packages =
      with pkgs;
      [
        devenv
        dconf
        neofetch
        htop
        hyprpaper
        bat
        nvimpager
        nh
        hwinfo
        obsidian
        wl-clipboard

        ## RUST
        # rest is found in rust overlay
        cargo-watch
        cargo-expand
        cargo-machete
        openssl
        pkg-config

        # screenshots
        grim
        slurp
        # image viewer
        vimiv-qt
        # image editing
        swappy

        dua

        bluetuith

        mpv

        redis
        # valkey

      ]
      ++ scripts;
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

  news.display = "show";

}
