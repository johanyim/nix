{ ... }:
{
  programs.fzf = {
    enable = true;
    # source <(fzf --zsh) works better
    # enableZshIntegration = true;
  };
}
