return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>",      desc = "Decrement selection", mode = "x" },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "astro",
          "arduino",
          "bash",
          "css",
          "diff",
          "dockerfile",
          "html",
          "java",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "regex",
          "rust",
          "toml",
          -- "tsx",
          "typescript",
          "vim",
          "xml",
          "yaml",
        },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- To jump to next objects even if outside of it
            keymaps = {
              ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
              ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },
              ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
              ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
              ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
              ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
              ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
              ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
              ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
              ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
              ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
              ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- so you can go back/forwards using <C-o> and <C-i>
            goto_next_start = {
              ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
              ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
              ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
              ["]c"] = { query = "@class.outer", desc = "Next class start" },
              ["]p"] = { query = "@parameter.outer", desc = "Next parameter start" },
            },
            goto_next_end = {
              ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
              ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
              ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
              ["]C"] = { query = "@class.outer", desc = "Next class end" },
              ["]P"] = { query = "@parameter.outer", desc = "Next parameter end" },
            },
            goto_previous_start = {
              ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
              ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
              ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
              ["[c"] = { query = "@class.outer", desc = "Next class start" },
              ["[p"] = { query = "@parameter.outer", desc = "Next parameter start" },
            },
            goto_previous_end = {
              ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
              ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
              ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
              ["[C"] = { query = "@class.outer", desc = "Next class end" },
              ["[P"] = { query = "@parameter.outer", desc = "Next parameter end" },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>lsp"] = "@parameter.inner", -- swap parameters/argument with next
              ["<leader>lsm"] = "@function.outer",  -- swap function with next
            },
            swap_previous = {
              ["<leader>lsP"] = "@parameter.inner", -- swap parameters/argument with prev
              ["<leader>lsM"] = "@function.outer",  -- swap function with previous
            },
          },
        },
      })
      -- Make moves repeatable
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
      -- vim way: ; goes to the direction you were moving.
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
    end,
  },
  -- Show context of the current function
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    enabled = true,
    opts = { mode = "cursor", max_lines = 3 },
  },
  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    opts = {},
  },
}
