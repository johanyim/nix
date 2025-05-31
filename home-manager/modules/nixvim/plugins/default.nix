{ ... }:
{
  imports = [
    ./colorizer.nix
    ./completions.nix
    ./lsp.nix
    ./lualine.nix
    ./markdown.nix
    ./none_ls.nix
    ./oil.nix
    ./rust.nix
    ./telescope.nix
    ./tmux_navigator.nix
    ./todo_comments.nix
    ./treesitter.nix
  ];
  programs.nixvim.plugins = {
    # TODO: configure this plugin with autocmds
    baleia.enable = true;
    nvim-autopairs.enable = true;
    lsp-lines.enable = true;
    web-devicons.enable = true;
    nvim-surround = {
      enable = true;
      settings = {
        move_cursor = false;
      };
    };
  };

}
