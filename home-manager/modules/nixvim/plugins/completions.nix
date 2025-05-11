{ ... }:
{
  programs.nixvim.plugins.luasnip.enable = true;

  programs.nixvim.plugins.friendly-snippets.enable = true;

  programs.nixvim.plugins.cmp-nvim-lsp.enable = true;
  programs.nixvim.plugins.cmp-buffer.enable = true;
  programs.nixvim.plugins.cmp-path.enable = true;
  programs.nixvim.plugins.cmp-cmdline.enable = true;
  programs.nixvim.plugins.cmp_luasnip.enable = true;

  programs.nixvim.plugins.cmp = {
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

}
