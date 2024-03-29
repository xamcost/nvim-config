-- which-key helps you remember key bindings by showing a popup
-- with the active keybindings of the command you started typing.
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gs"] = { name = "+surround" },
      ["z"] = { name = "+fold" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      -- ["<leader><tab>"] = { name = "+tabs" },
      ["<leader>b"] = { name = "+buffer" },
      -- ["<leader>c"] = { name = "+code" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>g"] = {
        name = "+git",
        h = { desc = "+hunks" },
      },
      ["<leader>l"] = {
        name = "+lsp",
        s = { desc = "+swap" },
      },
      ["<leader>q"] = { name = "+quit/session" },
      ["<leader>s"] = {
        name = "+search",
        n = { desc = "+noice" },
      },
      ["<leader>S"] = { name = "+sessions" },
      ["<leader>t"] = {
        name = "+terminal",
        c = { desc = "+copilot chat" },
      },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>w"] = { name = "+workspace" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
