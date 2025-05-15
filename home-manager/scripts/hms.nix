{ pkgs }:
# ${pkgs.home-manager}/bin/home-manager switch --flake "$HOME/nix/flake.nix"
pkgs.writeShellScriptBin "hms" ''
  ${pkgs.git}/bin/git diff 
  ${pkgs.git}/bin/git add "$HOME/nix"
  ${pkgs.nh}/bin/nh home  switch "$HOME/nix"





  if [ $? -eq 0 ]; then
    MESSAGE=$(nix-env --list-generations | grep current | awk '{print "Gen-" $1 " at " $2 " " $3}')
    ${pkgs.git}/bin/git commit -m "$MESSAGE"
  fi

''
