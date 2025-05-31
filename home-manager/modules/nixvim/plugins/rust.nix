{ ... }:
{
  programs.nixvim.plugins.rust-tools = {
    enable = true;
    reloadWorkspaceFromCargoToml = true;
    inlayHints = {
      auto = true;
      onlyCurrentLine = false;
      showParameterHints = true;
      parameterHintsPrefix = "<= ";
      otherHintsPrefix = "-> ";
      maxLenAlign = false;
      maxLenAlignPadding = 1;
      rightAlign = false;
      rightAlignPadding = 3;
      highlight = "LspInlayHint";
    };
  };
}
