return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "shaunsingh/nord.nvim",
  },
  {
    "glench/vim-jinja2-syntax",
    lazy = false,
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    -- run = "cd app && npm install",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          -- show labeled treesitter nodes around the cursor
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          -- jump to a remote location to execute the operator
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "n", "o", "x" },
        function()
          -- show labeled treesitter nodes around the search matches
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
    },
  },
  {
    "f-person/git-blame.nvim",
    lazy = false,
    config = function()
      require("gitblame").setup {
        enabled = false,
      }
    end,
  },
  {
    "deponian/nvim-base64",
    lazy = false,
    version = "*",
    keys = {
      -- Decode/encode selected sequence from/to base64
      -- (mnemonic: [b]ase64)
      { "<Leader>Bd", "<Plug>(FromBase64)", mode = "x" },
      { "<Leader>Be", "<Plug>(ToBase64)", mode = "x" },
    },
    config = function()
      require("nvim-base64").setup()
    end,
  },
}
