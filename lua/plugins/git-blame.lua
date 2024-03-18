return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  keys = {
    { "<Leader>gB", "<cmd>GitBlameToggle<cr>", mode = "n", desc = "Toggle git blame" },
  },
  config = function()
    require("gitblame").setup({
      enabled = false,
    })
  end,
}
