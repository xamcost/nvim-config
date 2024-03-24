return {
  "akinsho/toggleterm.nvim",
  config = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      -- dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "double",
      },
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.keymap.set("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>",
      { desc = "ToggleTerm lazygit", noremap = true, silent = true })
  end,
}
