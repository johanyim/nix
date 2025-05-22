{ ... }:
{
  programs.nixvim.extraFiles = {
    "ftplugin/nix.lua".text = ''
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
    '';
    "ftplugin/rust.lua".text = ''
      vim.lsp.inlay_hint.enable(false)
      vim.keymap.set("n", "K", require("rust-tools").hover_actions.hover_actions, { buffer = 0 }, {desc = "Open rust hover actions, info and documentation (rust-tools)"})
      vim.keymap.set("n", "J", require("rust-tools").join_lines.join_lines, {desc = "Join lines (rust-tools)"})
      vim.keymap.set("n", "<Leader>cA", require("rust-tools").code_action_group.code_action_group, { buffer = 0 }, {desc = "Open rust code actions"})
      vim.keymap.set("n", "gq", require("rust-tools").open_cargo_toml.open_cargo_toml, {desc = "Open Cargo.toml"})
    '';

    # vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr }, { desc = "Rust Hover Actions" })
    # vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr }, { desc = "Rust Code Actions" })
    # "ftplugin/[OTHER_FILETYPE].lua".text = ''
    #   vim.opt.tabstop = 2
    #   vim.opt.shiftwidth = 2
    # '';
  };

}
