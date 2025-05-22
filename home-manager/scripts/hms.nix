{ pkgs }:
pkgs.writeShellScriptBin "hms" ''
  # include all within home manager
  ${pkgs.git}/bin/git --no-pager diff 
  ${pkgs.git}/bin/git add "$HOME/nix/home-manager/"

  # home-manager switch
  ${pkgs.nh}/bin/nh home switch "$HOME/nix"

  # commit with message
  if [ $? -eq 0 ]; then
    GENERATION=$(
    home-manager generations \
    | sed 1q \
    | awk '{print $5}'
    )

    COMMIT_MESSAGE=$(
    home-manager generations \
    | sed 1q \
    | awk '{print "HomeManager[" $5 "] at " $1 " " $2 }'
    )
    
    ${pkgs.git}/bin/git commit -m "$COMMIT_MESSAGE"
    ${pkgs.libnotify}/bin/notify-send "Generation $GENERATION" "Home-manager"
  fi

''
