{ pkgs }:
pkgs.writeShellScriptBin "nrs" ''
  ${pkgs.git}/bin/git --no-pager diff 
  ${pkgs.git}/bin/git add "$HOME/nix"
  ${pkgs.git}/bin/git restore --staged "$HOME/nix/home-manager"

  MESSAGE=$(nix-env --list-generations \
  | grep current \
  | awk '{print "NixOS[" $1 "] at " $2 " " $3}')
    ${pkgs.git}/bin/git commit -m "$MESSAGE"

  if [ $? -eq 0 ]; then
    sudo nixos-rebuild switch --flake "$HOME/nix"
  fi
''
