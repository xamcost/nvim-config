return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
      },
      { "nvim-lua/plenary.nvim" },
      { "crispgm/telescope-heading.nvim" },
    },
    keys = {
      -- {
      --   "<leader>,",
      --   "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      --   desc = "Switch Buffer",
      -- },
      -- { "<leader>/", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      -- { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      -- { "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
      -- find
      -- { "<leader>fc", Util.telescope.config_files(), desc = "Find Config File" },
      { "<leader>ff",  function() require("telescope.builtin").find_files() end,                                   desc = "Find Files" },
      { "<leader>fF",  function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end, desc = "Find All Files" },
      { "<leader>fg",  "<cmd>Telescope git_files<cr>",                                                             desc = "Find Files (git-files)" },
      { "<leader>fr",  "<cmd>Telescope oldfiles<cr>",                                                              desc = "Find Recent" },
      -- { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
      -- git
      { "<leader>gc",  "<cmd>Telescope git_commits<CR>",                                                           desc = "Find Commits" },
      { "<leader>gs",  "<cmd>Telescope git_status<CR>",                                                            desc = "Find Status" },
      -- markdown
      { '<leader>mh',  "<cmd>Telescope heading<cr>",                                                               desc = "Find Headers" },
      -- search
      { '<leader>f"',  "<cmd>Telescope registers<cr>",                                                             desc = "Find Registers" },
      { "<leader>fa",  "<cmd>Telescope autocommands<cr>",                                                          desc = "Auto Commands" },
      { "<leader>fbb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",                              desc = "Find Buffers" },
      { "<leader>fbc", "<cmd>Telescope current_buffer_fuzzy_find<cr>",                                             desc = "Find in Current Buffer" },
      { "<leader>fch", "<cmd>Telescope command_history<cr>",                                                       desc = "Command History" },
      { "<leader>fcc", "<cmd>Telescope commands<cr>",                                                              desc = "Commands" },
      { "<leader>fdc", "<cmd>Telescope diagnostics bufnr=0<cr>",                                                   desc = "Current Document diagnostics" },
      { "<leader>fdd", "<cmd>Telescope diagnostics<cr>",                                                           desc = "Workspace diagnostics" },
      { "<leader>fk",  "<cmd>Telescope keymaps<cr>",                                                               desc = "Key Maps" },
      { "<leader>fm",  "<cmd>Telescope man_pages<cr>",                                                             desc = "Man Pages" },
      { "<leader>fM",  "<cmd>Telescope marks<cr>",                                                                 desc = "Jump to Mark" },
      { "<leader>fw",  function() require("telescope.builtin").live_grep() end,                                    desc = "Live Grep" },
      {
        "<leader>fW",
        function()
          require("telescope.builtin").live_grep {
            additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
          }
        end,
        desc = "Live Grep (all)"
      },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>",                                                             desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>",                                                            desc = "Search Highlight Groups" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>",                                                           desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>",                                                                desc = "Resume" },
      { "<leader>sw", function() require("telescope.builtin").grep_string { word_match = "-w" } end,              desc = "Word (root dir)" },
      { "<leader>sW", function() require("telescope.builtin").grep_string { cwd = false, word_match = "-w" } end, desc = "Word (cwd)" },
      { "<leader>ss", function() require("telescope.builtin").grep_string() end,                                  mode = "v",                       desc = "Selection (root dir)" },
      { "<leader>sS", function() require("telescope.builtin").grep_string { cwd = false } end,                    mode = "v",                       desc = "Selection (cwd)" },
      { "<leader>uC", function() require("telescope.builtin").colorscheme { enable_preview = true } end,          desc = "Colorscheme with preview" },
      {
        "<leader>sL",
        function()
          require("telescope.builtin").lsp_document_symbols {
            symbols = require("lazyvim.config").get_kind_filter(),
          }
        end,
        desc = "Goto Symbol",
      },
      {
        "<leader>sl",
        function()
          require("telescope.builtin").lsp_dynamic_workspace_symbols {
            symbols = require("lazyvim.config").get_kind_filter(),
          }
        end,
        desc = "Goto Symbol (Workspace)",
      },
      -- { "<leader>sw", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
      -- { "<leader>sW", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
      -- { "<leader>sw", Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
      -- { "<leader>sW", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
      -- { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
      -- {
      --   "<leader>ss",
      --   function()
      --     require("telescope.builtin").lsp_document_symbols({
      --       symbols = require("lazyvim.config").get_kind_filter(),
      --     })
      --   end,
      --   desc = "Goto Symbol",
      -- },
      -- {
      --   "<leader>sS",
      --   function()
      --     require("telescope.builtin").lsp_dynamic_workspace_symbols({
      --       symbols = require("lazyvim.config").get_kind_filter(),
      --     })
      --   end,
      --   desc = "Goto Symbol (Workspace)",
      -- },
    },
    opts = function()
      local actions = require("telescope.actions")

      local open_with_trouble = require("trouble.sources.telescope").open
      -- local find_files_no_ignore = function()
      --   local action_state = require("telescope.actions.state")
      --   local line = action_state.get_current_line()
      --   Util.telescope("find_files", { no_ignore = true, default_text = line })()
      -- end
      -- local find_files_with_hidden = function()
      --   local action_state = require("telescope.actions.state")
      --   local line = action_state.get_current_line()
      --   Util.telescope("find_files", { hidden = true, default_text = line })()
      -- end

      return {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          -- open files in the first window that is an actual file.
          -- use the current window if no other window is available.
          get_selection_window = function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == "" then
                return win
              end
            end
            return 0
          end,
          mappings = {
            i = {
              ["<c-t>"] = open_with_trouble,
              -- ["<a-i>"] = find_files_no_ignore,
              -- ["<a-h>"] = find_files_with_hidden,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
            },
            n = {
              ["<c-t>"] = open_with_trouble,
              ["q"] = actions.close,
            },
          },
          extensions = {
            heading = {
              treesitter = true,
            }
          }
        },
      }
    end,
  },
  {
    "crispgm/telescope-heading.nvim",
  }
}
