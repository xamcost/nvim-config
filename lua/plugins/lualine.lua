return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  config = function()
    vim.o.laststatus = vim.g.lualine_laststatus

    vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
    local git_blame = require("gitblame")

    require("lualine").setup({
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },

        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename" },
        },
        lualine_x = {
          -- stylua: ignore
          -- {
          --   function() return require("noice").api.status.command.get() end,
          --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          --   color = Util.ui.fg("Statement"),
          -- },
          -- stylua: ignore
          -- {
          --   function() return require("noice").api.status.mode.get() end,
          --   cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          --   color = Util.ui.fg("Constant"),
          -- },
          -- stylua: ignore
          -- {
          --   function() return "  " .. require("dap").status() end,
          --   cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
          --   color = Util.ui.fg("Debug"),
          -- },
          -- {
          --   require("lazy.status").updates,
          --   cond = require("lazy.status").has_updates,
          --   color = Util.ui.fg("Special"),
          -- },
          {
            "diff",
            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          -- function()
          --   return " " .. os.date("%R")
          -- end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    })
  end,
}
