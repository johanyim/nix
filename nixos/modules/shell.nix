{ pkgs, baseColors, ... }:

{
  programs.zsh = {
    enable = true;
    # enableCompletions = true; 
    autosuggestions.enable = false;
    syntaxHighlighting.enable = true;
    interactiveShellInit = ''
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

      ZVM_VI_HIGHLIGHT_FOREGROUND=black             
      ZVM_VI_HIGHLIGHT_BACKGROUND=white
      ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold    
    '';

  };

  programs.starship = {
    enable = true;
    settings = {
      palette = "catppuccin_mocha";
      format = "$directory$git_branch$git_status$nodejs$rust$golang$php$python$conda\n$sudo$character ";
      right_format = "$shell $time";
      continuation_prompt = "   $character ";
      add_newline = false;

      line_break.disabled = true;
      username = {
        style_user = "bg:white bold fg:crust";
        style_root = "black bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };

      directory = {
        style = "red";
        format = "[ $path ]($style)";
        read_only = "";
        truncation_length = 6;
        truncation_symbol = "…/";
        truncate_to_repo = false;
      };

      git_branch = {
        symbol = "";
        style = "bg:surface1";
        format = "[[$symbol $branch ](blue)]($style)";

      };

      git_status = {
        style = "bg:surface1";
        format = "[[($all_status$ahead_behind )](blue)]($style)";
      };

      git_metrics = {
        added_style = "surface0";
        deleted_style = "surface0";
        only_nonzero_diffs = false;
        format = "([+$added]($added_style) )([-$deleted]($deleted_style) )";
        disabled = true;
      };

      nodejs = {
        symbol = "";
        style = "bg:surface0";
        format = "[[$symbol ($version) ](green)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:surface0";
        format = "[[$symbol ($version) ](peach)]($style)";
      };

      golang = {
        symbol = "󰟓";
        style = "sky";
        format = "[[$symbol ($version) ](sky)]($style)";
      };

      php = {
        symbol = "";
        style = "bg:#212736";
        format = "[[$symbol ($version) ](mauve)]($style)";
      };

      lua = {
        symbol = "";
        style = "lavender";
        format = "[[$symbol ($version) ](lavender)]($style)";
      };

      python = {
        symbol = "";
        style = "yellow";
        format = "[$\{symbol\} $\{pyenv_prefix\}($\{version\} )(\($virtualenv\) )]($style)";
      };

      conda = {
        symbol = "󱔎";
        style = "bg:surface0";
        format = "[[$symbol $environment](green)]($style)";

      };

      time = {
        time_format = "%H:%M:%S "; # Hour:Minute Format
        style = "bg:overlay0";
        format = "[[$time](surface0)]($style)";
        disabled = false;

      };

      shell = {
        zsh_indicator = "zsh";
        bash_indicator = "bash";
        fish_indicator = "fish";
        powershell_indicator = "powershell";
        cmd_indicator = "cmd";
        unknown_indicator = "mystery shell";
        style = "surface0";
        format = "[$indicator]($style)";
        disabled = false;

      };

      sudo = {
        symbol = " ";
        style = "fg:red";
        format = "[$symbol]($style)";
        disabled = false;
      };

      character = {
        success_symbol = "[](surface0)";
        error_symbol = "[](red)";
        vimcmd_symbol = "[](blue)";
        vimcmd_visual_symbol = "[](mauve)";
        vimcmd_replace_symbol = "[](mauve)";
        vimcmd_replace_one_symbol = "[](mauve)";
        format = "$symbol";
      };

      fill = {
        symbol = " ";
        style = "surface0";
      };

      palettes."catppuccin_mocha" = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };

    };
  };
}
