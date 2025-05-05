{
  config,
  lib,
  pkgs,
  baseColors,
  ...
}:
let
  rgb = lib.mapAttrs (name: hex: "#${hex}") baseColors;
in
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

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
      autoread = true;
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
    };

    keymaps = [
      {
        mode = "n";
        key = "-";
        action = "<cmd>Oil<CR>";
        options = {
          silent = true;
          desc = "Open Oil";
        };
      }
      {
        mode = "n";
        key = "<C-y>";
        action = ''"*y :let @+=@*<CR>'';
        options = {
          silent = true;
          desc = "Copy to clipboard (normal)";
        };
      }
      {
        mode = "v";
        key = "<C-y>";
        action = ''"*y :let @+=@*<CR>'';
        options = {
          silent = true;
          desc = "Copy to clipboard (normal)";
        };
      }

      #       set("n", "<C-y>", '"*y :let @+=@*<CR>', { noremap = true, desc = "Copy to clipboard" })
      # set("v", "<C-y>", '"*y :let @+=@*<CR>', { noremap = true, desc = "Copy to clipboard" })
    ];

    plugins.web-devicons.enable = true;

    plugins.oil = {
      enable = true;
      settings = {
        columns = [
          "permissions"
          "size"
          "icon"
        ];
        keymaps = {
          "g?" = "actions.show_help";
          "<CR>" = "actions.select";
          "<C-s>" = "actions.select_vsplit";
          "<C-h>" = "actions.select_split";
          "<C-t>" = "actions.select_tab";
          "<C-p>" = "actions.preview";
          "<C-c>" = "actions.close";
          "<C-l>" = "actions.refresh";
          "-" = "actions.parent";
          "_" = "actions.open_cwd";
          "`" = "actions.cd";
          "~" = "actions.tcd";
          "gs" = "actions.change_sort";
          "g." = "actions.toggle_hidden";
        };

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
      };
    };

    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim-lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
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

          GhostText = {
            fg = rgb.surface1;
          };
          LspInlayHint = {
            fg = rgb.surface1;
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

        };
      };
    };

    plugins.nvim-surround = {
      enable = true;
      settings = {
        move_cursor = false;
      };
    };
  };
}
