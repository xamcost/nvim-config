return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      panel = { enabled = false },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<M-Bslash>",
          -- next = "<C-.>",
          -- prev = "<C-,>",
          -- dismiss = "<C/>",
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      debug = true,          -- Enable debugging
      window = {
        layout = 'vertical', -- 'vertical', 'horizontal', 'float'
      },
      -- default mappings
      mappings = {
        close = 'q',
        reset = '<C-r>',
        complete = '<Tab>',
        submit_prompt = '<CR>',
        accept_diff = '<C-y>',
        show_diff = 'gd',
        show_system_prompt = 'gp',
        show_user_selection = 'gs',
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
    keys = {
      -- Quick chat with Copilot
      {
        "<leader>tcc",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      { "<leader>tce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>tct", "<cmd>CopilotChatTests<cr>",   desc = "CopilotChat - Generate tests" },
      { "<leader>tcd", "<cmd>CopilotChatDocs<cr>",    desc = "CopilotChat - Generate docs" },
      -- Chat with Copilot in visual mode
      {
        "<leader>tcv",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
    },
  },
}
