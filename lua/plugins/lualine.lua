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

    -- Display active lsp clients
    local function lsp_clients()
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return ''
      end

      local c = {}
      for _, client in pairs(clients) do
        if client.name ~= 'copilot' then
          table.insert(c, client.name)
        end
      end
      return '\u{f085}  ' .. table.concat(c, ' | ')
    end


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
          { "filename", path = 1 },
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
        },
        lualine_y = {
          { lsp_clients }
        },
        lualine_z = {
          { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
          -- function()
          --   return " " .. os.date("%R")
          -- end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    })
  end,
}
