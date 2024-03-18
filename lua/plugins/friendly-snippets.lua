return {
  "rafamadriz/friendly-snippets",
  lazy = true,
  event = { "InsertEnter", "CmdlineEnter" },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
