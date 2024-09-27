return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      dir_path = "_resources",
      prompt_for_file_name = false,
      relative_template_path = function()
        local working_dir = vim.fn.getcwd()
        if (working_dir:find("Obsidian/asphodel")) then
          return false
        end
        return true
      end,
    },
  },
  keys = {
    { "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
