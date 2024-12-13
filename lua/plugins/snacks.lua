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
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
  },
}
