return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")

    local flake8 = require("lint").linters.flake8
    flake8.args = {
      "--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s",
      "--max-line-length",
      "88",
      "--no-show-source",
      "--stdin-display-name",
      function() return vim.api.nvim_buf_get_name(0) end,
      "-",
    }
    local eslint_d = require("lint").linters.eslint_d
    eslint_d.args = {
      "--format",
      "json",
      "--fix",
      "--stdin",
      "--stdin-filename",
      function() return vim.api.nvim_buf_get_name(0) end,
    }

    lint.linters_by_ft = {
      python = { "flake8" },
      javascript = { "standardjs" },
      javascriptreact = { "standardjs" },
      typescript = { "ts-standard" },
      typescriptreact = { "ts-standard" },
      dockerfile = { "hadolint" },
      yaml = { "yamllint" },
      ["yaml.ansible"] = { "ansible_lint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
