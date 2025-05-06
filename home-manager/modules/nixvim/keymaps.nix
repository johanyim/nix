{ pkgs, ... }:
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

    ];

    plugins.lsp.keymaps = {
      lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
      };
      diagnostic = {

      };

    };

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

  };
}
