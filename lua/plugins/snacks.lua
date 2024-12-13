return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
  },
  keys = {
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Toggle Lazygit",
    },
  },
}