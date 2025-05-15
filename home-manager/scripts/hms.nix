{ pkgs }:
pkgs.writeShellScriptBin "hms" ''
  # include all within home manager
  ${pkgs.git}/bin/git --no-pager diff 
  ${pkgs.git}/bin/git add "$HOME/nix/home-manager/"

  # home-manager switch
  ${pkgs.nh}/bin/nh home switch "$HOME/nix"

  # commit with message
  if [ $? -eq 0 ]; then
    MESSAGE=$(

    home-manager generations \
    | sed 1q \
    | awk '{print "HomeManager[" $5 "] at " $1 " " $2 }'
    )
      ${pkgs.git}/bin/git commit -m "$MESSAGE"
  fi

''
