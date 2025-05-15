{ pkgs }:
# ${pkgs.home-manager}/bin/home-manager switch --flake "$HOME/nix/flake.nix"
pkgs.writeShellScriptBin "hms" ''
  ${pkgs.git}/bin/git --no-pager diff 
  ${pkgs.git}/bin/git add "$HOME/nix"


  MESSAGE=$(nix-env --list-generations \
  | grep current \
  | awk '{print "Gen[" $1 "] at " $2 " " $3}')
    ${pkgs.git}/bin/git commit --edit -m "$MESSAGE"

  if [ $? -eq 0 ]; then
    ${pkgs.nh}/bin/nh home switch "$HOME/nix"
  fi
''
