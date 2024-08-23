return {
  "epwalsh/obsidian.nvim",
  version = "*", -- use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown",
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    -- "BufReadPre path/to/my-vault/*.md",
    -- "BufNewFile path/to/my-vault/*.md",
    "BufReadPre " .. vim.fn.expand "~" .. "/Nextcloud/Obsidian/asphodel/*.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/Nextcloud/Obsidian/asphodel/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "asphodel",
        path = "~/Nextcloud/Obsidian/asphodel",
      },
    },

    new_notes_location = "current_dir",
    preferred_link_style = "markdown",

    -- Optional, customize how note file names are generated given the ID, target directory, and title.
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      local path = spec.dir / tostring(spec.title)
      return path:with_suffix(".md")
    end,

    attachments = {
      img_folder = "_resources",
    },
    mappings = {
      -- Follow link under cursor.
      ["<leader>of"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true, desc = "Follow link" },
      },
      -- Toggle check-boxes.
      ["<leader>oc"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true, desc = "Toggle checkbox" },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
      -- Search notes using Telescope.
      ["<leader>fo"] = {
        action = "<cmd>ObsidianQuickSwitch<cr>",
        opts = { buffer = true, desc = "Find in Obsidian" },
      },
      -- List all tags in Telescope
      ["<leader>ot"] = {
        action = "<cmd>ObsidianTags<cr>",
        opts = { noremap = false, desc = "List tags" },
      },
      -- Paste image
      ["<leader>op"] = {
        action = "<cmd>ObsidianPasteImg<cr>",
        opts = { buffer = true, desc = "Paste Image" },
      },
      -- Get a list of backlinks in Telescope.
      ["<leader>ob"] = {
        action = "<cmd>ObsidianBacklinks<cr>",
        opts = { buffer = true, desc = "Get backlinks" },
      },
    },
    picker = {
      name = "telescope.nvim",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = "<C-x>",
        -- Insert a tag at the current location.
        insert_tag = "<C-l>",
      },
    },
  },
}
