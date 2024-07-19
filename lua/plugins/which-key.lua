-- which-key helps you remember key bindings by showing a popup
-- with the active keybindings of the command you started typing.
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    spec = {
      mode = { "n", "v" },
      { "<leader>S",  group = "sessions" },
      { "<leader>b",  group = "buffer" },
      { "<leader>f",  group = "file/find" },
      { "<leader>g",  group = "git" },
      { "<leader>gh", desc = "+hunks" },
      { "<leader>l",  group = "lsp" },
      { "<leader>ls", desc = "+swap" },
      { "<leader>q",  group = "quit/session" },
      { "<leader>s",  group = "search" },
      { "<leader>sn", desc = "+noice" },
      { "<leader>t",  group = "terminal" },
      { "<leader>tc", desc = "+copilot chat" },
      { "<leader>u",  group = "ui" },
      { "<leader>w",  group = "workspace" },
      { "<leader>x",  group = "diagnostics/quickfix" },
      { "[",          group = "prev" },
      { "]",          group = "next" },
      { "g",          group = "goto" },
      { "gs",         group = "surround" },
      { "z",          group = "fold" },
    },
  },
}
