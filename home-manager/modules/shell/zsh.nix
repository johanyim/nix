{
  pkgs,
  ...
}:

{
  programs.zsh = {
    enable = true;
    # enableCompletions = true;
    autosuggestion.enable = false;
    syntaxHighlighting.enable = true;
    shellAliases = {
      "ls" = "eza -al";
      "cd" = "z";
      "t" = "tmux a";
      "grep" = "rg";
    };
    initContent = ''

      ZVM_VI_HIGHLIGHT_FOREGROUND=black             
      ZVM_VI_HIGHLIGHT_BACKGROUND=white
      ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold    

      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word

      autoload edit-command-line
      zle -N edit-command-line
      bindkey '^Xe' edit-command-line

      zstyle ':completion:*' menu select
      zmodload zsh/complist

      # show hidden files
      setopt globdots

      # use the vi navigation keys in menu completion
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history

    '';
    # source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    initExtra = ''
      eval "$(zoxide init zsh)"
      source <(${pkgs.fzf}/bin/fzf --zsh)

    '';

  };

}
