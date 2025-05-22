{ ... }:
{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources = {
      formatting = {
        shfmt.enable = true;
        markdownlint.enable = true;
        rustywind.enable = true;
      };
      code_actions = {
        statix.enable = true;
      };

      diagnostics = {
        markdownlint.enable = true;
      };
    };
  };

}
