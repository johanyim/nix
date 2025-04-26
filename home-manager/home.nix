{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./modules/bundle.nix
    # inputs.nixvim.homeManagerModules.nixvim
  ];

  home = {
    username = "johan";
    homeDirectory = "/home/johan";
    stateVersion = "23.11";
    packages = with pkgs; [
      neofetch
      htop
      hyprpaper
      bat
    ];
  };

  programs.git = {
    enable = true;
    userName = "johanyim";
    userEmail = "johanjyyim@gmail.com";
    extraConfig = {
      color.ui = "auto";
      pull.rebase = true;
      core.editor = "nvim";
      help.autocorrect = 10;
      core.pager = "bat --decorations=never";
      diff.algorithm = "histogram";
      merge.conflictstyle = "zdiff3";
      init.defaultBranch = "main";
    };
    aliases = {
      "lg1" = "log --abbrev-commit --decorate --format=format:'%C(bold yellow)[%as]: %C(reset)%C(bold blue)%h%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset) %C(dim black)[%ah]:%C(reset)' --all";
      "lg2" = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'";
      "lg" = "lg1";
      "wdiff" = "diff --word-diff=color";
      "wdiff2" = "diff --word-diff";

    };
  };

}
