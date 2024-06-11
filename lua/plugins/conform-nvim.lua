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
      -- astro = { { "prettier", "prettierd" } },
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt" },
      java = { "google-java-format" },
      javascript = { "standardjs" },
      javascriptreact = { "standardjs" },
      typescript = { "ts-standard" },
      typescriptreact = { "ts-standard" },
      json = { { "prettierd" } },
      -- yaml = { "yamlfix" },
    },
    -- Set up format-on-save
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 2000, lsp_fallback = true }
    end,
    -- Customize formatters
    formatters = {
      prettierd = {
        args = { "--no-semi", "--stdin-filepath", "$FILENAME" },
      },
      -- prettier = {
      --   args = function(ctx)
      --     if vim.endswith(ctx.filename, ".astro") then
      --       return { "--stdin-filepath", "$FILENAME", "--parser", "html" }
      --     end
      --     return { "--stdin-filepath", "$FILENAME" }
      --   end,
      -- },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end,
}
