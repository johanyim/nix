{
  baseColors,
  lib,
  ...
}:
let
  hex = lib.mapAttrs (name: color: "#${color}") baseColors;
in
{
  programs.starship = {
    enable = true;
    settings = {
      palette = "catppuccin_mocha";
      format = "$directory$git_branch$git_status$nix_shell$nodejs$rust$golang$php$python$conda\n$sudo$character ";
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

      nix_shell = {
        disabled = false;
        symbol = " ";
        impure_msg = "[impure](bold red)";
        pure_msg = "[pure](bold green)";
        style = "blue";
        # unknown_msg = "[unknown shell](bold yellow)";
        format = "[$symbol$state (\($name\))](bold blue) ";

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
        rosewater = "${hex.rosewater}";
        flamingo = "${hex.flamingo}";
        pink = "${hex.pink}";
        mauve = "${hex.mauve}";
        red = "${hex.red}";
        maroon = "${hex.maroon}";
        peach = "${hex.peach}";
        yellow = "${hex.yellow}";
        green = "${hex.green}";
        teal = "${hex.teal}";
        sky = "${hex.sky}";
        sapphire = "${hex.sapphire}";
        blue = "${hex.blue}";
        lavender = "${hex.lavender}";
        text = "${hex.text}";
        subtext1 = "${hex.subtext1}";
        subtext0 = "${hex.subtext0}";
        overlay2 = "${hex.overlay2}";
        overlay1 = "${hex.overlay1}";
        overlay0 = "${hex.overlay0}";
        surface2 = "${hex.surface2}";
        surface1 = "${hex.surface1}";
        surface0 = "${hex.surface0}";
        base = "${hex.base}";
        mantle = "${hex.mantle}";
        crust = "${hex.crust}";
      };

    };
  };
}
