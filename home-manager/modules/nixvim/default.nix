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

      # rust-vim
      # rust-tools-nvim
      # nvim-lsp-endhints

    ];

    extraConfigLua = ''
      -- require('rust.vim').setup({
        -- vim.g.rustfmt_autosave = 1
      -- }})
    '';

  };
}
