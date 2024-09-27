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
    build = "make tiktoken",
    opts = {
      debug = true,          -- Enable debugging
      window = {
        layout = "vertical", -- 'vertical', 'horizontal', 'float'
      },
      -- default mappings
      mappings = {
        complete = {
          detail = "Use @<Tab> or /<Tab> for options.",
          insert = "<Tab>",
        },
        close = {
          normal = "q",
          insert = "<C-c>",
        },
        reset = {
          normal = "<C-l>",
          insert = "<C-l>",
        },
        submit_prompt = {
          normal = "<CR>",
          insert = "<C-m>",
        },
        accept_diff = {
          normal = "<C-y>",
          insert = "<C-y>",
        },
        show_diff = {
          normal = "gd",
        },
        show_system_prompt = {
          normal = "gp",
        },
        show_user_selection = {
          normal = "gs",
        },
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
      { "<leader>tco", "<cmd>CopilotChatToggle<cr>",  desc = "CopilotChat - Toggle" },
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
