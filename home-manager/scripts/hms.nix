{ pkgs, config }:
pkgs.writeShellScriptBin "hms" ''
  ${pkgs.git}/bin/git add ${config.users.users.username.home}/nix
  ${pkgs.home-manager}/bin/home-manager switch --flake /home/johan/nix/flake.nix

  MESSAGE=$(nix-env --list-generations | grep current | awk '{print "Generation: " $1 " at " $2 " " $3}')

  ${pkgs.git}/bin/git commit -m "$MESSAGE"
''
