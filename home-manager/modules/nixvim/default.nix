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

    # TODO: configure this plugin with autocmds
    plugins.baleia.enable = true;
    plugins.nvim-autopairs.enable = true;
    plugins.lsp-lines.enable = true;
    plugins.web-devicons.enable = true;

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

    plugins.efmls-configs = {
      setup = {
        all.linter = [ "codespell" ];
        bash.formatter = [ "beautysh" ];
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

    plugins.rust-tools = {
      enable = true;
      reloadWorkspaceFromCargoToml = true;
      inlayHints = {
        auto = true;
        onlyCurrentLine = false;
        showParameterHints = true;
        parameterHintsPrefix = "<= ";
        otherHintsPrefix = "-> ";
        maxLenAlign = false;
        maxLenAlignPadding = 1;
        rightAlign = false;
        rightAlignPadding = 3;
        highlight = "LspInlayHint";
      };
    };

    # # Enable format on save
    # autoCmd = [
    #   {
    #     event = "BufWritePre";
    #     pattern = "*.rs";
    #     command = "lua vim.lsp.buf.format()";
    #   }
    # ];

    # plugins.conform-nvim.enable = true;

    # plugins.rustaceanvim = {
    #   enable = true;
    #   settings = {
    #     server = {
    #       default_settings = {
    #         rust-analyzer = {
    #           check = {
    #             command = "clippy";
    #           };
    #           inlayHints = {
    #             # lifetimeElisionHints = {
    #             #   enable = "never";
    #             # };
    #             typeHints = {
    #               enable = true;
    #               hideExplicitlyTyped = true;
    #             };
    #             renderColons = true;
    #           };
    #         };
    #       };
    #     };
    #   };
    # };

    extraPlugins = with pkgs.vimPlugins; [
      # harpoon
      # plenary-nvim

      rust-vim
      # rust-tools-nvim
      # nvim-lsp-endhints

    ];

    extraConfigLua = ''
      -- require('rust.vim').setup({
        vim.g.rustfmt_autosave = 1
      -- }})
    '';

  };
}
