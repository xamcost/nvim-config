return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier_standard,
        null_ls.builtins.formatting.rustywind,
        -- Set linters
        null_ls.builtins.diagnostics.ansiblelint,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.flake8.with({ extra_args = { "--max-line-length", "88" } }),
        null_ls.builtins.diagnostics.hadolint,
    }
    return config -- return final config table
  end,
}
