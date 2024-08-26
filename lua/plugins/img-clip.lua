return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    dir_path = "_resources",
    prompt_for_file_name = true,
  },
  keys = {
    { "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
