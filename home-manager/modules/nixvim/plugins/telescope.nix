{ ... }:
{
  programs.nixvim.plugins.telescope = {
    enable = true;
    # enabledExtensions = [ ];

    extensions = {
      # frecency = {
      #   enable = true;
      #   settings = { };
      # };
    };

    settings = {
      defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
        ];
        layout_config = {
          prompt_position = "bottom";
        };

        layout_strategy = "flex";

        prompt_prefix = " ";
        selection_caret = " ";
        color_devicons = true;

        results_title = "";
        prompt_title = "";

        dynamic_preview_title = true;

        borderchars = [
          "─"
          "│"
          "─"
          "│"
          "╭"
          "╮"
          "╯"
          "╰"
        ];

        mappings = {
          i = {
            "<A-j>" = {
              __raw = "require('telescope.actions').move_selection_next";
            };
            "<A-k>" = {
              __raw = "require('telescope.actions').move_selection_previous";
            };
          };
        };
        set_env = {
          COLORTERM = "truecolor";
        };
        sorting_strategy = "descending";
      };

    };

  };

}
