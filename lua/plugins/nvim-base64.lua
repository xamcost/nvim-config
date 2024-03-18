return {
  "deponian/nvim-base64",
  event = "VeryLazy",
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
}
