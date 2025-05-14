{ pkgs }:
pkgs.writeShellScriptBin "hms" ''
  ${pkgs.git}/bin/git add /home/johan/nix/flake.nix
  ${pkgs.home-manager}/bin/home-manager switch --flake /home/johan/nix/flake.nix
''
