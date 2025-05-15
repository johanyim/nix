{ pkgs }:
pkgs.writeShellScriptBin "hms" ''
  ${pkgs.git}/bin/git --no-pager diff 
  ${pkgs.git}/bin/git add "$HOME/nix/home-manager/"

  MESSAGE=$(

  home-manager generations \
  | sed 1q \
  | awk '{print "HomeManager[" $5 "] at " $1 " " $2 }'
  )
    ${pkgs.git}/bin/git commit -m "$MESSAGE"

  if [ $? -eq 0 ]; then
    ${pkgs.nh}/bin/nh home switch "$HOME/nix"
  fi
''
