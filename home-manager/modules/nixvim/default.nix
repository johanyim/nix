{
  lib,
  pkgs,
  baseColors,
  ...
}:
let
  rgb = lib.mapAttrs (name: hex: "#${hex}") baseColors;
in
{

  imports = [
    ./keymaps.nix
    ./ftplugin
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        configs = true;
        plugins = true;
      };
    };

    globals = {
      mapleader = ",";
    };
    opts = {
      number = true;
      relativenumber = false;
      showcmd = true;
      laststatus = 2;
      autowrite = true;
      cursorline = true;
      cursorcolumn = true;
      history = 10000;
      showmode = false;

      # tabs
      shiftwidth = 4;
      tabstop = 4;
      # roud to nearest tabsize
      shiftround = true;
      # use spaces for tab
      expandtab = true;

      # indentations
      autoindent = true;
      smartindent = true;
      # -- read more on this
      # cindent = true

      hlsearch = true;
      ignorecase = true;
      smartcase = true;

      # git signs
      signcolumn = "yes";

      # tab completion options as a menu
      wildmenu = true;

      spelllang = "en_gb";

      # space between line and bottom/top of buffer
      scrolloff = 4;
      # sidescrolloff= 20

      # TESTING this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test LOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO

      # use term gui colors
      termguicolors = true;

      # Set completeopt to have a better completion experience
      completeopt = [
        "menuone"
        "noselect"
        "noinsert"
      ]; # mostly just for cmp

      # Enable persistent undo history
      swapfile = false;
      autoread = true;
      backup = false;
      undofile = true;

      encoding = "utf-8";
      fileencoding = "utf-8";
    };

    plugins.web-devicons.enable = true;

    plugins.oil = {
      enable = true;
      settings = {
        columns = [
          "permissions"
          "size"
          "icon"
        ];

        experimental_watch_for_changes = true;
        view_options = {
          show_hidden = true;
        };

      };
    };
    plugins.lsp-format.enable = true;

    plugins.lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd = {
          enable = true;
          filetypes = [ "nix" ];
          settings = {
            formatting = {
              command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
            };
          };
        };

        # rust_analyzer = {
        #   enable = true;
        #   filetypes = [ "rust" ];
        # };

      };

    };

    plugins.cmp = {

      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "luasnip"; }
          { name = "buffer"; }
        ];

        mapping = {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          # Alt-L must have a selection, cannot auto select
          "<M-l>" = ''
            cmp.mapping.confirm({
              i = function(fallback)
                  if cmp.visible() and cmp.get_active_entry() then
                      cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                  else
                      fallback()
                  end
              end,
              s = cmp.mapping.confirm({ select = true }),
              c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
            				})'';
          "<M-j>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
          "<M-k>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";

        };

        snippet = {
          expand = ''
            function(args)
              require("luasnip").lsp_expand(args.body)
            end'';
        };
        experimental = {
          ghost_text = {
            hl_group = "GhostText";
          };
        };
      };

    };

    plugins.cmp-nvim-lsp.enable = true;
    plugins.cmp-buffer.enable = true;
    plugins.cmp-path.enable = true;
    plugins.cmp-cmdline.enable = true;
    plugins.cmp_luasnip.enable = true;
    plugins.luasnip.enable = true;
    plugins.friendly-snippets.enable = true;

    plugins.lualine = {
      enable = true;
      settings = {
        options.theme = {
          # icons_enabled = true;
          normal = {
            a = {
              fg = rgb.blue;
              bg = rgb.crust;
            };
            b = {
              fg = rgb.mauve;
              bg = rgb.crust;
            };
            c = {
              fg = rgb.surface1;
              bg = rgb.crust;
            };
            x = {
              fg = rgb.surface0;
              bg = rgb.crust;
            };
            y = {
              fg = rgb.surface1;
              bg = rgb.crust;
            };
            z = {
              fg = rgb.surface1;
              bg = rgb.crust;
            };
          };
          insert = {
            a = {
              fg = rgb.green;
              bg = rgb.crust;
            };
            z = {
              fg = rgb.surface1;
              bg = rgb.crust;
            };
          };
          visual = {
            a = {
              fg = rgb.mauve;
              bg = rgb.crust;
            };
            z = {
              fg = rgb.surface1;
              bg = rgb.crust;
            };
          };
          command = {
            a = {
              fg = rgb.peach;
              bg = rgb.crust;
            };
            z = {
              fg = rgb.surface1;
              bg = rgb.crust;
            };
          };
          replace = {
            a = {
              fg = rgb.red;
              bg = rgb.crust;
            };
            z = {
              fg = rgb.surface1;
              bg = rgb.crust;
            };
          };
        };
        options.component_separators = {
          left = "";
          right = "";
        };
        options.section_separators = {
          left = "";
          right = "";
        };

        #[
        #{"filetype"
        #{ icon = { align = "right"; }; }
        #]

        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [
            "branch"
            "diagnostics"
          ];
          lualine_c = [ "filename" ];
          lualine_x = [ ];
          lualine_y = [ "progress" ];
          lualine_z = [ "location" ];
        };
        inactive_sections = {
          lualine_a = [ ];
          lualine_b = [ ];
          lualine_c = [ "filename" ];
          lualine_x = [ "location" ];
          lualine_y = [ ];
          lualine_z = [ ];
        };
      };

    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {

        disable_underline = true;
        flavour = "mocha";
        integrations = {
          cmp = true;
          gitsigns = true;
          notify = false;
          treesitter = true;
        };
        term_colors = true;
        custom_highlights = {
          Normal = {
            fg = rgb.text;
            bg = rgb.crust;
          };
          Comment = {
            fg = rgb.overlay1;
            style = { };
          };
          CursorLine = {
            bg = rgb.mantle;
          };
          NormalNC = {
            fg = rgb.text;
            bg = rgb.crust;
          };
          NormalFloat = {
            fg = rgb.text;
            bg = rgb.crust;
          };
          LineNr = {
            fg = rgb.surface0;
          };

          DiagnosticVirtualTextError = {
            fg = rgb.red;
          };
          DiagnosticVirtualTextWarning = {
            fg = rgb.yellow;
          };
          DiagnosticVirtualTextInfo = {
            fg = rgb.sapphire;
          };
          DiagnosticVirtualTextHint = {
            fg = rgb.teal;
          };

          GhostText = {
            fg = rgb.surface1;
          };
          LspInlayHint = {
            fg = rgb.surface1;
            bg = "";
          };

        };
      };
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

    # plugins.rust-tools = {
    #   enable = true;
    #
    #   inlayHints = {
    #     auto = false;
    #     onlyCurrentLine = false;
    #     showParameterHints = true;
    #     parameterHintsPrefix = "<= ";
    #     otherHintsPrefix = "-> ";
    #     maxLenAlign = false;
    #     maxLenAlignPadding = 1;
    #     rightAlign = false;
    #     rightAlignPadding = 3;
    #     highlight = "LspInlayHint";
    #   };
    #
    #   hoverActions = {
    #     border = [
    #       # [
    #       #   "┏"
    #       #   "FloatBorder"
    #       # ]
    #       # [
    #       #   "━"
    #       #   "FloatBorder"
    #       # ]
    #       # [
    #       #   "┓"
    #       #   "FloatBorder"
    #       # ]
    #       # [
    #       #   "┃"
    #       #   "FloatBorder"
    #       # ]
    #       # [
    #       #   "┛"
    #       #   "FloatBorder"
    #       # ]
    #       # [
    #       #   "━"
    #       #   "FloatBorder"
    #       # ]
    #       # [
    #       #   "┗"
    #       #   "FloatBorder"
    #       # ]
    #       # [
    #       #   "┃"
    #       #   "FloatBorder"
    #       # ]
    #
    #     ];
    #     autoFocus = false;
    #
    #   };
    # };

    extraPlugins = with pkgs.vimPlugins; [
      # rust-vim
      # rust-tools-nvim
      # nvim-lsp-endhints

    ];

  };
}

# return {
# 	{
# 		"simrat39/rust-tools.nvim",
# 		config = function()
# 			local rt = require("rust-tools")
#
# 			rt.setup({
# 				tools = {
# 					inlay_hints = {
# 						auto = true,
# 						only_current_line = false,
# 						show_parameter_hints = true,
# 						parameter_hints_prefix = "<= ",
# 						other_hints_prefix = "-> ",
# 						max_len_align = false,
# 						max_len_align_padding = 1,
# 						right_align = false,
# 						right_align_padding = 3,
# 						highlight = "LspInlayHint",
# 					},
# 					hover_actions = {
# 						border = {
# 							{ "┏", "FloatBorder" },
# 							{ "━", "FloatBorder" },
# 							{ "┓", "FloatBorder" },
# 							{ "┃", "FloatBorder" },
# 							{ "┛", "FloatBorder" },
# 							{ "━", "FloatBorder" },
# 							{ "┗", "FloatBorder" },
# 							{ "┃", "FloatBorder" },
# 						},
# 						auto_focus = false,
# 					},
# 				},
# 				server = {
# 					on_attach = function(_, bufnr)
# 						-- Info and documentation + Hover actions
# 						-- vim.lsp.inlay_hint.enable(false)
# 					end,
# 				},
# 			})
# 			rt.inlay_hints.enable()
# 		end,
# 	},
# 	{
# 		"rust-lang/rust.vim",
# 		ft = "rust",
# 		init = function()
# 			vim.g.rustfmt_autosave = 1
# 		end,
# 	},
# 	{
# 		"vxpm/ferris.nvim",
# 		ft = { "rust" },
# 		opts = {
# 			-- your options here
# 		},
# 	},
#
# 	"saecki/crates.nvim",
# }
