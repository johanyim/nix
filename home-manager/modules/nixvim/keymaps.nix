{ ... }:
{
  programs.nixvim = {
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
      {
        mode = [
          "i"
          "s"
        ];
        key = "<M-l>";
        action = ''
          function()
            local ls = require("luasnip")
            if ls.jumpable(1) then
              ls.jump(1)
            end
          end
        '';
        lua = true;
        options = {
          silent = true;
          desc = "Jump to the next snippet anchor";
        };
      }
      {
        mode = [
          "i"
          "s"
        ];
        key = "<M-h>";
        action = ''
          function()
            local ls = require("luasnip")
            if ls.jumpable(-1) then
              ls.jump(-1)
            end
          end
        '';
        lua = true;
        options = {
          silent = true;
          desc = "Jump to the previous snippet anchor";
        };
      }

      {
        mode = [
          "n"
        ];
        key = "<Space><Space>";
        action = "<cmd>Telescope oldfiles<CR>";
        # lua = true;
        options = {
          silent = true;
          desc = "Telescope: Oldfiles";
        };
      }

      {
        mode = [
          "n"
        ];
        key = "<Space>g";
        action = "<cmd>Telescope live_grep<CR>";
        options = {
          silent = true;
          desc = "Telescope: Live Grep";
        };
      }

      {
        mode = [
          "n"
        ];
        key = "<Space>p";
        action = "<cmd>Telescope find_files<CR>";
        options = {
          silent = true;
          desc = "Telescope: Find Files";
        };
      }

      {
        mode = [
          "n"
        ];
        key = "<Space>g";
        action = "<cmd>Telescope live_grep<CR>";
        options = {
          silent = true;
          desc = "Telescope: Live Grep";
        };
      }

    ];

    lsp.keymaps = [

      {
        lspBufAction = "hover";
        key = "K";
      }
      {
        lspBufAction = "references";
        key = "gD";
      }
      {
        lspBufAction = "definition";
        key = "gd";
      }
      {
        lspBufAction = "implementation";
        key = "gi";
      }
      {
        lspBufAction = "type_definition";
        key = "gt";
      }
      {
        lspBufAction = "code_action";
        key = "<Leader>ca";
      }
      {
        lspBufAction = "rename";
        key = "<Leader>rn";
      }
    ];

    plugins.oil.settings.keymaps = {
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

    plugins.lsp-lines.luaConfig.content = ''
      local lines = require("lsp_lines")
      lines.setup({})

      local diagnostics_active = true
      vim.diagnostic.config({
          virtual_lines = false,
          virtual_text = true,
      })

      vim.keymap.set("n", "<leader>d", function()
          if diagnostics_active then
              vim.diagnostic.config({
                  virtual_text = false,
                  virtual_lines = true,
              })
          else
              vim.diagnostic.config({
                  virtual_text = true,
                  virtual_lines = false,
              })
          end
          diagnostics_active = not diagnostics_active
      end)

    '';

  };
}
