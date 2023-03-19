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
}
