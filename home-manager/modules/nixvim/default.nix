{
  lib,
  pkgs,
  baseColors,
  ...
}:
let
  hex = lib.mapAttrs (name: color: "#${color}") baseColors;
in
{

  imports = [
    ./plugins
    ./catppuccin.nix
    ./color-highlights.nix
    ./ftplugin.nix
    ./keymaps.nix
    ./options.nix
  ];
  programs.nixvim = {

    enable = true;
    defaultEditor = true;

    plugins.tmux-navigator = {
      enable = true;
      settings = {
        disable_when_zoomed = 1;
      };
      keymaps = [
        {
          action = "left";
          key = "<A-h>";
        }
        {
          action = "down";
          key = "<A-j>";
        }
        {
          action = "up";
          key = "<A-k>";
        }
        {
          action = "right";
          key = "<A-l>";
        }
      ];
    };

    plugins.web-devicons.enable = true;

    plugins.treesitter = {
      enable = true;
      # folding = true;
      settings = {
        ensure_installed = [
          "rust"
          "markdown"
          "nix"
        ];
        highlight.enable = true;
        indent.enable = true;
        auto_install = true;
        sync_install = true;
        plugins.treesitter.nixvimInjections = true;
      };
    };

    plugins.colorizer = {
      enable = true;
      settings = {
        user_default_options = {
          tailwind = true;
          css = true;
          RGB = true;
          RRGGBB = true;
          RRGGBBAA = true;

        };
      };
    };

    plugins.nvim-surround = {
      enable = true;
      settings = {
        move_cursor = false;
      };
    };

    plugins.lsp-lines.enable = true;

    plugins.efmls-configs = {
      setup = {
        all.linter = [ "codespell" ];
        bash.formatter = [ "beautysh" ];
        # c = {
        #   formatter = [ "clang_tidy" ];
        #   linter = [ "clang_tidy" ];
        # };
        # "c++" = {
        #   formatter = [ "clang_tidy" ];
        #   linter = [ "clang_tidy" ];
        # };
        # cmake = {
        #   formatter = [ "gersemi" ];
        #   linter = [ "cmake_lint" ];
        # };
        css = {
          formatter = [ "prettier" ];
          linter = [ "proselint" ];
        };
        gitcommit.linter = [ "gitlint" ];
        html = {
          formatter = [ "prettier" ];
          linter = [ "proselint" ];
        };
        lua = {
          formatter = [ "lua_format" ];
          linter = [ "luacheck" ];
        };
        markdown = {
          formatter = [ "mdformat" ];
          linter = [ "proselint" ];
        };
        nix = {
          formatter = [ "nixfmt" ];
          linter = [ "statix" ];
        };
        python = {
          formatter = [ "black" ];
          linter = [ "ruff" ];
        };
        rust.formatter = [ "rustfmt" ];
        vim.linter = [ "vint" ];
        zsh.formatter = [ "beautysh" ];
      };
    };

    plugins.harpoon = {
      enable = true;
      # enableTelescope = false;
      # package = pkgs.vimPlugins.harpoon;
      # luaConfig = '''';
    };
    #
    #   settings = {
    #
    #     save_on_toggle = false;
    #     save_on_change = true;
    #     enter_on_sendcmd = false;
    #     tmux_autoclose_windows = false;
    #     # excluded_filetypes = [ "harpoon" ];
    #     # mark_branch = false;
    #     # tabline = true;
    #     # tabline_prefix = " |";
    #     # tabline_suffix = "| ";
    #
    #   };
    #
    # };

    plugins.rustaceanvim = {
      enable = true;
      settings = {
        server = {
          default_settings = {
            rust-analyzer = {
              check = {
                command = "clippy";
              };
              inlayHints = {
                lifetimeElisionHints = {
                  enable = "always";
                };
                typeHints = {
                  enable = false;
                  hideExplicitlyTyped = true;
                };
                renderColons = true;
              };
            };
          };
        };
      };
    };
    extraPlugins = with pkgs.vimPlugins; [

      # harpoon
      # plenary-nvim

      # rust-vim
      # rust-tools-nvim
      # nvim-lsp-endhints

    ];

  };
}
