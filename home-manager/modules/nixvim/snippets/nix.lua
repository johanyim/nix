local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("...", {
    t({"", 
        "\tlib,",
        "\tbaseColors,",
        "\t...",
      "}:",
      "let",
        "\thex = lib.mapAttrs (name: color: \"#${color}\") baseColors;",
      "in",
      "{", 
        "\t" }), i(1, "programs"), 
    t({"", ""})
  })
}
