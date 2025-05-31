{ pkgs, lib, ... }:
{
  programs.nixvim.plugins.lsp-format.enable = true;

  programs.nixvim.plugins.lsp = {
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
      emmet_language_server = {
        enable = true;
        filetypes = [
          "svelte"
          "html"
          "jsx"
        ];
      };

      bashls = {
        enable = true;
        filetypes = [
          "sh"
          "bash"
          "zsh"
        ];
      };
    };
  };

  programs.nixvim.plugins.efmls-configs = {
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

}
