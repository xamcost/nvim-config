return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>lf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      astro = { { "prettier", "prettierd" } },
      lua = { "stylua" },
      python = { "isort", "black" },
      -- java = { "google-java-format" },
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { { "prettierd", "prettier" } },
      -- yaml = { "yamlfix" },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      prettier = {
        args = function(ctx)
          if vim.endswith(ctx.filename, ".astro") then
            return { "--stdin-filepath", "$FILENAME", "--parser", "html" }
          end
          return { "--stdin-filepath", "$FILENAME" }
        end,
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
