{ ... }:
{
  programs.nixvim.extraFiles = {
    "ftplugin/nix.lua".text = ''
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
    '';

    # "ftplugin/[OTHER_FILETYPE].lua".text = ''
    #   vim.opt.tabstop = 2
    #   vim.opt.shiftwidth = 2
    # '';
  };

}
